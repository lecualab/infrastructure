output "vpc" {
  description = "VPC related IDs"
  value = {
    id                 = aws_vpc.main.id
    public_subnet_ids  = aws_subnet.public_subnets[*].id
    private_subnet_ids = aws_subnet.private_subnets[*].id
  }
}

output "lambda" {
  description = "Lambda related IDs"
  value = {
    security_group_id = aws_security_group.lambda_outbound_traffic_sg.id
  }
}

output "bastion" {
  description = "Bastion information"
  value = {
    public_ip  = aws_eip.bastion_eip.public_ip
    public_dns = aws_eip.bastion_eip.public_dns
  }
  depends_on = [aws_eip.bastion_eip]
}

output "landing_page_db" {
  description = "Landing Page DB connection"
  sensitive   = true
  value = {
    host     = aws_db_instance.landing_page_db.address
    port     = aws_db_instance.landing_page_db.port
    username = aws_db_instance.landing_page_db.username
    password = aws_db_instance.landing_page_db.password
    database = aws_db_instance.landing_page_db.db_name
  }
}
