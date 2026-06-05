output "resource_group_name" {
  description = "The name of the global resource group"
  value       = module.resource_group.name
}

output "location" {
  description = "The location of the resource group"
  value       = module.resource_group.location
}