resource "aws_iam_user" "legacy_dev_user" {
  name = "legacy-dev-user"

  tags = {
    project = var.project_name
    Managed = "Imported"
  }
  
}

resource "aws_iam_user" "ci_user" {
  name = "${var.project_name}-ci-user"

  tags = {
    Project = var.project_name
    Purpose = "ci-cd"
  }
}

# IAM Policy for S3 read-only access
resource "aws_iam_policy" "s3_read_only_policy" {
  name        = "${var.project_name}-s3-readonly"
  description = "Read-only access to S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach S3 read-only policy to CI user
resource "aws_iam_user_policy_attachment" "ci_user_s3_attach" {
  user       = aws_iam_user.ci_user.name
  policy_arn = aws_iam_policy.s3_read_only_policy.arn
}

#here

# IAM Role for EC2 instances
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach S3 read-only policy to EC2 role
resource "aws_iam_role_policy_attachment" "ec2_s3_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_only_policy.arn
}

# IAM Instance Profile for EC2 instances
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

