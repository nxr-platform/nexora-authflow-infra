# prod data — Cosmos DB, Redis, Service Bus
# This root configuration calls modules only.
# No resource blocks directly in this file.

# Example remote state reference:
# data "terraform_remote_state" "shared" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "nxr-authflow-tfstate-rg"
#     storage_account_name = "nxrauthflowtfstate"
#     container_name       = "tfstate"
#     key                  = "authflow/shared/shared.tfstate"
#     use_oidc             = true
#   }
# }
