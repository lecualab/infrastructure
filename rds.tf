locals {
  landing_page_db = var.rds_settings.landing_page
}

resource "aws_security_group" "postgres_rds_sg" {
  name        = "postgres_rds"
  description = "Allow to communicate with Postgres RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow all inbound traffic from outbound_traffic_sg"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [
      aws_security_group.bastion_sg.id,
      aws_security_group.lambda_outbound_traffic_sg.id
    ]
  }
}

resource "random_password" "landing_page_rds_password" {
  length           = 16
  override_special = "_!()"
}

resource "aws_db_subnet_group" "landing_page_db_subnet_group" {
  name        = "landing_page_db_subnet_group"
  description = "Subnet group for the landing page RDS instance"
  subnet_ids  = [for subnet in aws_subnet.private_subnets : subnet.id]

  tags = {
    Project = var.projects.landing_page
  }
}

resource "aws_db_instance" "landing_page_db" {
  identifier                   = local.landing_page_db.identifier
  engine                       = local.landing_page_db.engine
  engine_version               = local.landing_page_db.engine_version
  instance_class               = local.landing_page_db.instance_class
  db_name                      = local.landing_page_db.db_name
  deletion_protection          = local.landing_page_db.deletion_protection
  username                     = local.landing_page_db.username
  password                     = random_password.landing_page_rds_password.result
  allocated_storage            = 10
  backup_retention_period      = 7
  db_subnet_group_name         = aws_db_subnet_group.landing_page_db_subnet_group.name
  vpc_security_group_ids       = [aws_security_group.postgres_rds_sg.id]
  storage_encrypted            = true
  skip_final_snapshot          = true
  performance_insights_enabled = true

  tags = {
    Project = var.projects.landing_page
  }
}
