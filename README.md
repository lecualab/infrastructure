# Lecualab's Infrastructure

This repository contains the infrastructure code for Lecualab's projects.

## TL;DR

```bash
# Initialize the workspace
terraform init

# Validate and apply the configuration
terraform apply
```

> When the `apply` is being executed, you will need to validate the domain ownership
> by creating a `TXT` and the `CNAME` records in your DNS provider.
