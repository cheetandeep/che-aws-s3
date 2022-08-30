# Terraform module for S3 buckets

This repository hosts my custom code which is a wrapper around [AWS S3 terraform resource](https://registry.terraform.io/providers/hashicorp%20%20/aws/latest/docs/resources/s3_bucket) to create production grade AWS S3 buckets. 

This module creates 

1. AWS S3 bucket
2. Attaches required IAM policy 


## Usage

```
module "state_bucket" {
  source             = "./s3_bucket"
  bucket_name_suffix = "tfsate"
  account_name           = "<AWS_Account>"
  env                = "<Your_Environment>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.che_org_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.che_org_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.upload_to_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Account in which the s3 bucket is being created | `string` | n/a | yes |
| <a name="input_bucket_name_suffix"></a> [bucket\_name\_suffix](#input\_bucket\_name\_suffix) | Suffix describing the function of the s3 bucket | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment in which the s3 bucket is being created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Bucket name |
| <a name="output_policy_document"></a> [policy\_document](#output\_policy\_document) | n/a |
<!-- END_TF_DOCS -->