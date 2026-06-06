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

output "acr_id" {
  description = "The ID of the Container Registry"
  value       = module.acr.id
}

output "acr_name" {
  description = "The name of the Container Registry"
  value       = module.acr.name
}

output "acr_login_server" {
  description = "The login server URL of the Container Registry"
  value       = module.acr.login_server
}