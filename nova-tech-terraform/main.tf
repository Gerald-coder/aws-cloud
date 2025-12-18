# main.tf — VPC (Terraform Registry module)

# Query available AZs in the region so the module can pick 2 AZs
data "aws_availability_zones" "available" {
  state = "available"
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.7.1"

  name = "${var.project_name}-${var.environment}-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2) # first 2 AZs
  public_subnets  = var.public_subnets
  private_subnets = var.priivate_subnet


  enable_dns_hostnames = true
  enable_dns_support   = true

  # create NAT gateways? not needed for purely public subnets; keep minimal
  single_nat_gateway = true
  enable_nat_gateway = true

  # tags
  tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = "true"
  }

  public_subnet_tags = {
    Tier = "public"
  }
}


resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-sg"
  description = "Security Group for EC2 web server"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "Allow ALL outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}



module "ec2_web_server" {
  source = "./modules/ec2-web-server"

  name           = "${var.project_name}-${var.environment}"
  ami            = var.ami # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]  # fix
  key_name       = var.key_name # replace with your key pair name
  vpc_id         = module.vpc.vpc_id
  count = var.num
  sg_id          = aws_security_group.ec2_sg.id
  instance_profile_name = aws_iam_instance_profile.ec2_profile.name

  private_key_path = "~/.ssh/${var.key_name}.pem"

}