terraform {
  backend "azurerm" {
    resource_group_name  = "nxr-authflow-tfstate-rg"
    storage_account_name = "nxrauthflowtfstate"
    container_name       = "tfstate"
    key                  = "authflow/environments/dev/security.tfstate"
    use_oidc             = true
  }
}
