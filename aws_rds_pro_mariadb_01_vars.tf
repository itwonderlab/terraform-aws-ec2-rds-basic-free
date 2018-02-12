# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# RDS MariaDB
#----------------------

variable "aws_sec_group_rds_pro_mariadb_01" {
  description = "Security group for RDS Postgresql"
  type        = "map"
}
variable "aws_sec_rule_rds_pro_mariadb_01_instances_to_db_port" {
  description = "Access from Instances to DB port"
  type        = "map"
}
variable "aws_rds_pro_mariadb_01" {
  description = "RDS PRO Maria DB 01"
  type        = "map"
}
