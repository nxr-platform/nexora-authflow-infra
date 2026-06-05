output "resource_group_name" {
  description = "The name of the global resource group"
  value       = module.resource_group.name
}

output "location" {
  description = "The location of the resource group"
  value       = module.resource_group.location
}

output "keyvault_id" {
  description = "The ID of the Key Vault"
  value       = module.keyvault.id
}

output "keyvault_uri" {
  description = "The URI of the Key Vault"
  value       = module.keyvault.uri
}

output "keyvault_name" {
  description = "The name of the Key Vault"
  value       = module.keyvault.name
}