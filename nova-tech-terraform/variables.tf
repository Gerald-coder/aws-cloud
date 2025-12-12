variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "nova-tech"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0fa91bc90632c73c9" # Ubuntu 22.04 (eu-north-1 example)
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default = "t3.micro"
}
variable "key_name" {
  description = "key name for ssh access"
  type        = string
  default = "route-53-key"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs (one per AZ)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "priivate_subnet" {
  description = "list of public subnet cidrs"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "count" {
  description = "number of ec2"
  default = 2
  type = number
}