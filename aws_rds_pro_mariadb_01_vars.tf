# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# RDS MariaDB
#----------------------

variable "aws_sg_rds_mariadb_pro_pub_01" {
  description = "Security group for RDS Postgresql"
  type        = map
}
variable "aws_sr_rds_mariadb_pro_pub_01_instances_to_db_port" {
  description = "Access from Instances to DB port"
  type        = map
}
variable "aws_rds_mariadb_pro_pub_01" {
  description = "RDS PRO Maria DB 01"
  type        = map
}
