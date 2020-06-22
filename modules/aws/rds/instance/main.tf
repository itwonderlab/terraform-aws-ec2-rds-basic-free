# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates an RDS Instance
# See http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
# ---------------------------------------------------

resource "aws_db_instance" "default" {
  identifier                = var.identifier
  allocated_storage         = var.allocated_storage
  storage_type              = var.storage_type
  final_snapshot_identifier = format("%s-%s", var.final_snapshot_id, uuid())
  skip_final_snapshot       = var.skip_final_snapshot
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  password                  = var.password
  username                  = var.username
  availability_zone         = var.availability_zone
  backup_retention_period   = var.backup_retention_period
  backup_window             = var.backup_window
  maintenance_window        = var.maintenance_window
  multi_az                  = var.multi_az
  publicly_accessible       = var.publicly_accessible
  vpc_security_group_ids    = var.vpc_security_group_ids
  db_subnet_group_name      = var.db_subnet_group_name
  parameter_group_name      = var.parameter_group_name
  storage_encrypted         = var.storage_encrypted
  apply_immediately         = var.apply_immediately
  auto_minor_version_upgrade= var.auto_minor_version_upgrade
  allow_major_version_upgrade = var.allow_major_version_up

  tags = merge(
      var.instance_tags,
      {
        "private_name" = var.tag_private_name,
        "public_name"  = var.tag_public_name,
        "environment" = var.tags_environment,
        "app"         = var.tag_app,
        "app_id"      = var.tag_app_id,
        "os"          = var.tag_os,
        "cost_center" = var.tag_cost_center
      }
    )

  lifecycle {
      ignore_changes = [final_snapshot_identifier]
  }


}
