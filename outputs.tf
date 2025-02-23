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
