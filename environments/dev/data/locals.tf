locals {
  common_tags = merge(var.tags, {
    product     = "authflow"
    managed-by  = "terraform"
    environment = var.environment
    owner       = "platform-team"
    cost-centre = "nexora-platform"
  })
}
