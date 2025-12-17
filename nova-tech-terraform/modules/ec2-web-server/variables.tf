variable "name" {
  description = "Name tag for the instance"
  type        = string
}

variable "ami" {
  description = "EC2 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will run"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID of the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}
variable "num" {
  description = "number of ec2"
  default = 2
  type = number
}

variable "sg_id" {
  description = "The Security Group ID to attach to EC2 instances"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}
