output "name_servers" {
  description = "Name servers assigned to the Route 53 hosted zone"
  value       = module.route53.name_servers
}

output "zone_id" {
  description = "ID of the Route 53 hosted zone"
  value       = module.route53.zone_id
}

output "zone_name" {
  description = "Name of the Route 53 hosted zone"
  value       = module.route53.zone_name
}
