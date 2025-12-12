# main.tf — VPC (Terraform Registry module)

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${var.project_name}-${var.environment}-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2) # first 2 AZs
  public_subnets  = var.public_subnets

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
