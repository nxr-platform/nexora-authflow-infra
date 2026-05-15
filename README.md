# nexora-authflow-infra

Environment infrastructure for AuthFlow — dev, staging, and prod.

## Structure

```
environments/
├── dev/
│   ├── security/   Key Vault, managed identities
│   ├── data/       Cosmos DB, Redis, Service Bus
│   └── aks/        AKS cluster
├── staging/
│   ├── security/
│   ├── data/
│   └── aks/
└── prod/
    ├── security/
    ├── data/
    └── aks/
```

## Deployment Order (per environment)

```
1. security/   (Key Vault — required by data and aks)
2. data/       (Cosmos, Redis, Service Bus)
3. aks/        (AKS cluster — depends on network, keyvault, data)
```

## Credentials

| Environment | Service Principal | Subscription |
|-------------|-------------------|--------------|
| dev/staging | sp-nonprod | nonprod subscription |
| prod | sp-prod | prod subscription |
