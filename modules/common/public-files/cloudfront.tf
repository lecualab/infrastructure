locals {
  s3_origin_id = "${var.s3_settings.bucket_name}-origin"
}

resource "aws_cloudfront_distribution" "main" {
  depends_on      = [aws_acm_certificate.main]
  enabled         = true
  is_ipv6_enabled = true
  price_class     = "PriceClass_All"
  comment         = "Lecualab's public files"
  aliases         = [var.cloudfront_settings.domain_name]

  origin {
    domain_name = aws_s3_bucket.main.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.main.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6" # Managed-CachingOptimized
    response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63" # Managed-CORS-with-preflight-and-SecurityHeadersPolicy
    viewer_protocol_policy     = "redirect-to-https"
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD", "OPTIONS"]
    target_origin_id           = local.s3_origin_id
  }

  ordered_cache_behavior {
    path_pattern               = "*"
    response_headers_policy_id = aws_cloudfront_response_headers_policy.main.id
    cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6" # Managed-CachingOptimized
    viewer_protocol_policy     = "redirect-to-https"
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD", "OPTIONS"]
    target_origin_id           = local.s3_origin_id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.main.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

resource "aws_cloudfront_response_headers_policy" "main" {
  name    = "Static-Files-Cache-Control-Headers-Policy"
  comment = "Add Cache-Control headers to static files"

  custom_headers_config {
    items {
      header   = "Cache-Control"
      override = true
      value    = "max-age=604800, must-revalidate" # 1 week
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "main" {
  comment = "Origin Access Identity for S3 bucket"
}
