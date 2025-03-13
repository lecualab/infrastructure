resource "aws_ses_configuration_set" "main" {
  name                       = "ses_config"
  reputation_metrics_enabled = true
}

resource "aws_ses_domain_identity" "main" {
  domain = var.ses_settings.domain_name
}

resource "aws_ses_domain_mail_from" "main" {
  domain           = aws_ses_domain_identity.main.domain
  mail_from_domain = "internal.${aws_ses_domain_identity.main.domain}"
}

resource "aws_ses_domain_dkim" "main" {
  domain = aws_ses_domain_identity.main.domain
}

resource "aws_ses_domain_identity_verification" "main" {
  domain = aws_ses_domain_identity.main.id
}

resource "aws_ses_email_identity" "main" {
  email = var.ses_settings.email_identity
}
