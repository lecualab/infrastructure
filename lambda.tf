resource "aws_security_group" "lambda_outbound_traffic_sg" {
  vpc_id      = aws_vpc.main.id
  name        = "lambda_outbound_traffic"
  description = "Allow lambdas to communicate with internet"

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
