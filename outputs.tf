output "policy_document" {
  value = data.aws_iam_policy_document.upload_to_bucket.json
}

output "bucket_name" {
  value       = module.bucket.name
  description = "Bucket name"
}