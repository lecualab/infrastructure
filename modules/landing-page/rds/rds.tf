locals {
  landing_page_db = var.rds_settings.landing_page
}

resource "random_password" "landing_page_rds_password" {
  length           = 16
  override_special = "_!()"
}

resource "aws_db_instance" "landing_page_db" {
  identifier                   = local.landing_page_db.identifier
  engine                       = local.landing_page_db.engine
  engine_version               = local.landing_page_db.engine_version
  instance_class               = local.landing_page_db.instance_class
  publicly_accessible          = local.landing_page_db.publicly_accessible
  username                     = local.landing_page_db.username
  password_wo                  = random_password.landing_page_rds_password.result
  allocated_storage            = 10
  backup_retention_period      = 7
  storage_encrypted            = true
  skip_final_snapshot          = true
  performance_insights_enabled = true
  deletion_protection          = true

  tags = {
    Project = var.projects.landing_page
  }
}
