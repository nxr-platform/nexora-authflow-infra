locals {
  company   = "nxr"
  domain    = "authflow"
  component = "core"

  region_short = {
    uksouth    = "uks"
    ukwest     = "ukw"
    westeurope = "euw"
  }

  resource_group_name = "${local.company}-${local.domain}-${local.component}-rg-${var.environment}-${local.region_short[var.location]}"

  common_tags = merge(var.tags, {
    product     = "authflow"
    managed-by  = "terraform"
    environment = var.environment
    owner       = "platform-team"
    cost-centre = "nexora-platform"
  })
}

data "azurerm_client_config" "current" {}

module "resource_group" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/resource-group?ref=v0.1.3"

  company     = local.company
  domain      = local.domain
  component   = local.component
  location    = var.location
  environment = var.environment
  tags        = local.common_tags
}

module "keyvault" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/keyvault?ref=v0.7.1"

  resource_group_name           = module.resource_group.name
  company                       = local.company
  domain                        = local.domain
  component                     = local.component
  location                      = var.location
  environment                   = var.environment
  rbac_authorization_enabled    = var.rbac_authorization_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  sku_name                      = var.sku_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  public_network_access_enabled = var.public_network_access_enabled
  purge_protection_enabled      = var.purge_protection_enabled
  tags                          = local.common_tags
}

