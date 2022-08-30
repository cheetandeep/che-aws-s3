locals {
  bkt_prefix = "bkt-che-${var.account_name}-${var.bucket_name_suffix}"
}

data "aws_iam_policy_document" "upload_to_bucket" {
  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.che_org_s3_bucket.arn}/*"]
  }
  statement {
    effect = "Allow"

  }
}

resource "aws_s3_bucket" "che_org_s3_bucket" {
  bucket_prefix = local.bkt_prefix

  force_destroy = "true"

  tags = {
    Name        = local.bkt_prefix
    Environment = var.env
    project     = var.account_name
  }
  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket_public_access_block" "che_org_s3_bucket" {
  bucket = aws_s3_bucket.che_org_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
