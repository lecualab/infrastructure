# Lecualab's Public Files Infrastructure

This module contains the infrastructure code to serve Lecualab's public files.

> This [blog](https://mikefallows.com/posts/add-a-custom-url-to-cloudfront-with-cloudflare/) was
> used in order to create this module.

## TL;DR

```bash
# Initialize the workspace
terraform init

# Validate and apply the configuration
terraform apply
```

> When the `apply` is being executed, you will need to validate the domain ownership
> by creating the `CNAME` records in your DNS provider.
> Do this by accesing to the AWS console and copying the created `AWS Certificate Manager`
> DNS-related info.
