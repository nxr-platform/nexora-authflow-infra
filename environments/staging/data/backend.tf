terraform {
  backend "azurerm" {
    resource_group_name  = "nxr-authflow-tfstate-rg"
    storage_account_name = "nxrauthflowtfstate"
    container_name       = "tfstate"
    key                  = "authflow/environments/staging/data.tfstate"
    use_oidc             = true
  }
}
