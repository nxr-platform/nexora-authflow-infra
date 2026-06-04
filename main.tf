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

  common_tags   = merge(var.tags, {
    product     = "authflow"
    managed-by  = "terraform"
    environment = var.environment
    owner       = "platform-team"
    cost-centre = "nexora-platform"
  })
}

module "resource_group" {
  source = "git::https://github.com/nxr-platform/nexora-authflow-terraform-modules.git//modules/resource-group?ref=v0.1.3"

  company     = local.company
  domain      = local.domain
  component   = local.component
  location    = var.location
  environment = var.environment
  tags        = local.common_tags
}

 