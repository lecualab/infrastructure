# Lecualab's Mailing Infrastructure

This module contains the infrastructure code for Lecualab's mailing services.

## TL;DR

```bash
# Initialize the workspace
terraform init

# Validate and apply the configuration
terraform apply
```

> When the `apply` is being executed, you will need to validate the domain ownership
> by creating a `TXT` and the `CNAME` records in your DNS provider.
