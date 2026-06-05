variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"

  validation {
    condition     = contains(["uksouth", "ukwest", "westeurope"], var.location)
    error_message = "location must be uksouth, ukwest, or westeurope"
  }
}

variable "environment" {
  description = "Deployment environment injected by the pipeline"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod"
  }
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}


variable "sku_name" {
  description = "SKU name for the Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

variable "rbac_authorization_enabled" {
  description = "Whether to enable RBAC authorization for the Key Vault"
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault resources (7-90)"
  type        = number
  default     = 7
}

variable "public_network_access_enabled" {
  description = "Whether to enable public network access to the Key Vault"
  type        = bool
  default     = false
}