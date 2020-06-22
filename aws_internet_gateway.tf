# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# AWS Internet Gateway
#----------------------

#Create an Internet GW
module "aws_internet_gw" {
  source = "./modules/aws/network/internet_gateway"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_internet_gw_name
}
