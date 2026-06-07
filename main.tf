locals {
  company   = "nxr"
  domain    = "authflow"
  component = "core"

  common_tags = merge(var.tags, {
    product     = "authflow"
    managed-by  = "terraform"
    environment = var.environment
    owner       = "platform-team"
    cost-centre = "nexora-platform"
  })
}

data "azurerm_client_config" "current" {}

module "naming" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/naming?ref=v0.0.1"

  company     = local.company
  domain      = local.domain
  component   = local.component
  environment = var.environment
  location    = var.location
}

module "resource_group" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/resource-group?ref=v0.1.4"

  name     = module.naming.names.resource_group
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/keyvault?ref=v0.7.3"

  name                          = module.naming.names.key_vault
  resource_group_name           = module.resource_group.name
  location                      = var.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  rbac_authorization_enabled    = var.rbac_authorization_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  sku_name                      = var.sku_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = local.common_tags
}

module "managed_identity" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/managed-identity?ref=v0.8.0"

  name                = module.naming.names.managed_identity
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

resource "azurerm_role_assignment" "mi_keyvault" {
  scope                = module.keyvault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.managed_identity.principal_id
}

module "log-analytics" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/log-analytics?ref=v0.9.1"

  name                = module.naming.names.log_analytics
  resource_group_name = module.resource_group.name
  location            = var.location
  sku                 = var.log_analytics_sku
  retention_in_days  = var.log_analytics_retention_in_days
  tags                = local.common_tags
}