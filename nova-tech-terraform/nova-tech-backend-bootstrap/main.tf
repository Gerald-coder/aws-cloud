provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "nova-tech-terraform-state"
  

  tags = {
    Name        = "nova-tech-tf-state"
    Environment = "shared"
  }
}


resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "nova-tech-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "nova-tech-tf-locks"
  }
}
