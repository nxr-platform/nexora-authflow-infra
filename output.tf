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

output "managed_identity_id" {
  description = "The ID of the managed identity"
  value       = module.managed_identity.id
}

output "managed_identity_client_id" {
  description = "The client ID of the managed identity"
  value       = module.managed_identity.client_id
}

output "managed_identity_principal_id" {
  description = "The principal ID of the managed identity"
  value       = module.managed_identity.principal_id
}

output "log_analytics_id" {
  description = "The ID of the Log Analytics workspace"
  value       = module.log-analytics.id
}

output "log_analytics_workspace_id" {
  description = "The workspace ID of the Log Analytics workspace"
  value       = module.log-analytics.workspace_id
}