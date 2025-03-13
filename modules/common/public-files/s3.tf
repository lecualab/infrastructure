resource "aws_s3_bucket" "main" {
  bucket = var.s3_settings.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "main" {
  depends_on = [aws_s3_bucket_ownership_controls.main]
  bucket     = aws_s3_bucket.main.id
  acl        = "private"
}

resource "aws_s3_bucket_policy" "main" {
  depends_on = [aws_s3_bucket_public_access_block.main]
  bucket     = aws_s3_bucket.main.id
  policy     = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.main.iam_arn]
    }

    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.main.arn}/**"]
  }
}
