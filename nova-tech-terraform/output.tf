output "project_name" {
  value = var.project_name
}
output "environment" {
  value = var.environment
}


output "vpc_id" {
  description = "VPC id created by the module"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets_ids
}

output "public_route_table_ids" {
  description = "Public route table ids (for reference)"
  value       = module.vpc.public_route_table_ids
}