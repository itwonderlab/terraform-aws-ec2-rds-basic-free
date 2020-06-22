# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# VPC
#-----------------------------------------

variable "aws_vpc_block" {
  description = "Private IP block for the VPC in CIDR format"
}

variable "aws_vpc_tag_name" {
  description = "Name of the VPC"
}
