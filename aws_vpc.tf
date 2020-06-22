# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# VPC
#-----------------------------------------

#Create a VPC
module "aws_network_vpc" {
  source           = "./modules/aws/network/vpc"
  aws_vpc_block    = var.aws_vpc_block
  aws_vpc_tag_name = var.aws_vpc_tag_name
}
