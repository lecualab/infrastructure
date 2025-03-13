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
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
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

resource "aws_cloudfront_origin_access_identity" "main" {
  comment = "Origin Access Identity for S3 bucket"
}
