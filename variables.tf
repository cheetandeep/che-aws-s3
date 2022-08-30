variable "bucket_name_suffix" {
  type        = string
  description = "Suffix describing the function of the s3 bucket"
}

variable "account_name" {
  type        = string
  description = "Account in which the s3 bucket is being created"
}

variable "bucket_prefix" {
  type        = string
  default     = null
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length"
}

variable "env" {
  type        = string
  description = "Environment in which the s3 bucket is being created"
}