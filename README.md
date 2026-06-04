## Dependencies

Reads shared network outputs via Terraform remote state:

```hcl
data "terraform_remote_state" "shared" {
  backend = "azurerm"
  config = {
    key = "authflow/shared/shared.tfstate"
  }
}
```

## Pipeline

| Trigger | Action |
|---------|--------|
| PR → main | terraform plan for dev + staging |
| Merge → main | terraform apply to dev (automatic) |
| Manual trigger | terraform apply to staging |

## Environment Variables (injected by pipeline)

| Variable | Values |
|----------|--------|
| environment | dev, staging, prod |
| location | uksouth, ukwest, westeurope |

## State

| Environment | State Key |
|-------------|-----------|
| dev | authflow/environments/dev/terraform.tfstate |
| staging | authflow/environments/staging/terraform.tfstate |
| prod | authflow/environments/prod/terraform.tfstate |

## Credentials

| Environment | Service Principal | Subscription |
|-------------|-------------------|--------------|
| dev + staging | nxr-authflow-sp-nonprod | nexora-authflow-nonprod |
| prod | nxr-authflow-sp-prod | nexora-authflow-prod |

## Module Sources

| Module | Version |
|--------|---------|
| resource-group | v0.1.3 |