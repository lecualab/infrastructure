output "landing_page_db" {
  description = "Landing Page DB connection"
  sensitive   = true
  value = {
    host     = aws_db_instance.landing_page_db.address
    port     = aws_db_instance.landing_page_db.port
    username = aws_db_instance.landing_page_db.username
    password = random_password.landing_page_rds_password.result
  }
}
