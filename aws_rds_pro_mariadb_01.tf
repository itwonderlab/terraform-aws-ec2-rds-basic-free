# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# RDS MariaDB
#----------------------

# SECURITY
  # Group
  module "aws_sec_group_rds_pro_mariadb_01" {
    source      = "./modules/aws/security/group"
    vpc_id      = "${module.aws_network_vpc.id}"
    name        = "${var.aws_sec_group_rds_pro_mariadb_01["sec_name"]}"
    description = "${var.aws_sec_group_rds_pro_mariadb_01["sec_description"]}"
  }

  # Rules
  # Access from instances in group aws_sec_group_ec2_default to DB Port
  module "aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port" {
    source            = "./modules/aws/security/rule/source_group"
    security_group_id = "${module.aws_sec_group_rds_pro_mariadb_01.id}"
    type              = "${var.aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port["type"]}"
    from_port         = "${var.aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port["from_port"]}"
    to_port           = "${var.aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port["to_port"]}"
    protocol          = "${var.aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port["protocol"]}"
    source_security_group_id = "${module.aws_sec_group_ec2_default.id}"
    description       = "${var.aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port["description"]}"
  }

module "aws_rds_pro_mariadb_01" {
  source = "./modules/aws/rds/instance"

  identifier              = "${var.aws_rds_pro_mariadb_01["identifier"]}"
  allocated_storage       = "${var.aws_rds_pro_mariadb_01["allocated_storage"]}"
  storage_type            = "${var.aws_rds_pro_mariadb_01["storage_type"]}"
  final_snapshot_id       = "${var.aws_rds_pro_mariadb_01["final_snapshot_id"]}"
  skip_final_snapshot     = "${var.aws_rds_pro_mariadb_01["skip_final_snapshot"]}"
  engine                  = "${var.aws_rds_pro_mariadb_01["engine"]}"
  engine_version          = "${var.aws_rds_pro_mariadb_01["engine_version"]}"
  instance_class          = "${var.aws_rds_pro_mariadb_01["instance_class"]}"
  password                = "${var.aws_rds_pro_mariadb_01["password"]}"
  username                = "${var.aws_rds_pro_mariadb_01["username"]}"
  availability_zone       = "${var.aws_rds_pro_mariadb_01["availability_zone"]}"
  backup_retention_period = "${var.aws_rds_pro_mariadb_01["backup_retention_period"]}"

  db_subnet_group_name    = "${module.aws_rds_sn_pub_pro_01.id}" #"${var.aws_rds_sn_pro_01["name"]}"

  # Workaround for dependency. We need Terraform to wait for aws_rds_sn_pro_01 creation before the RDS DB can use it.

  multi_az                = "${var.aws_rds_pro_mariadb_01["multi_az"]}"
  vpc_security_group_ids  = ["${module.aws_sec_group_rds_mariadb_default.id}","${module.aws_sec_group_rds_pro_mariadb_01.id}"]
  publicly_accessible     = "${var.aws_rds_pro_mariadb_01["publicly_accessible"]}"

  #parameter_group_name    = "${aws_db_parameter_group.rds_pos_96_db_parameter_group_01.id}"
  allow_major_version_up  = "${var.aws_rds_pro_mariadb_01["allow_major_version_up"]}"
  tag_private_name        = "${var.aws_rds_pro_mariadb_01["tag_private_name"]}"
  tag_public_name         = "${var.aws_rds_pro_mariadb_01["tag_public_name"]}"
  tag_app                 = "${var.aws_rds_pro_mariadb_01["tag_app"]}"
  tag_app_id              = "${var.aws_rds_pro_mariadb_01["tag_app_id"]}"
  tag_os                  = "${var.aws_rds_pro_mariadb_01["tag_os"]}"
  tags_environment        = "${var.aws_rds_pro_mariadb_01["tags_environment"]}"
  tag_cost_center         = "${var.aws_rds_pro_mariadb_01["tag_cost_center"]}"
}
