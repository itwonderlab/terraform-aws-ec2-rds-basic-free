# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# SECURITY - Default group
#-------------------------

variable "aws_sec_group_rds_mariadb_default" {
  description = "Default Security Group for all Maria DB instances"
  type        = "map"
}

variable "aws_sec_rule_rds_mariadb_default_internet_to_db_port" {
  description = "Access from Instances to DB port"
  type        = "map"
}
