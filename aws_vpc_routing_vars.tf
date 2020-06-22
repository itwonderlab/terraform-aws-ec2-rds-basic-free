# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# ROUTING
#-----------------------------------------

variable "aws_main_route_table_name" {
  description = "Main VPC route table"
}

variable "aws_internet_route" {
  description = "Internet route"
  type        = map
}

variable "aws_private_route_table_za_name" {
  description = "VPC route table for private SN in zone A"
}

variable "aws_private_route_table_zb_name" {
  description = "VPC route table for private SN in zone B"
}
