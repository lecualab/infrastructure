output "cloudfront" {
  description = "Public files' CloudFront distribution"
  value = {
    domain_name = aws_cloudfront_distribution.main.domain_name
  }
}

output "acm" {
  description = "ACM certificate"
  value = {
    domain_name = aws_acm_certificate.main.domain_name
  }
}
