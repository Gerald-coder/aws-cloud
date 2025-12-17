terraform {
  backend "s3" {
    bucket         = "nova-tech-terraform-state"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "nova-tech-terraform-locks"
    encrypt        = true
  }
}
