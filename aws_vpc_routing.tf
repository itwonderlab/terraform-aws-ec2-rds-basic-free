# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.


#-----------------------------------------
# ROUTING
#-----------------------------------------

#-----------------------------------------
# MAIN Route Table (Default for all SUBNETS)
# Used for public zones / subnets
# It is the default route table if no other
# is specified
#-----------------------------------------

module "aws_main_route_table_public" {
  source = "./modules/aws/network/route/table"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_main_route_table_name
}

#Add an Internet GW to the VPC routing main table
module "aws_internet_route" {
  source                 = "./modules/aws/network/route/add"
  route_table_id         = module.aws_main_route_table_public.id
  gateway_id             = module.aws_internet_gw.id
  destination_cidr_block = var.aws_internet_route["destination_cidr_block"]
  name                   = var.aws_internet_route["name"]
}

# Set new main_route_table as main
resource "aws_main_route_table_association" "default" {
  vpc_id         = module.aws_network_vpc.id
  route_table_id = module.aws_main_route_table_public.id
}

#-----------------------------------------
# Private Route Table
# Used for private zone / subnet that have
# instances without a public IP address
# Each subnet should have its own route table
# as the NAT gateway lives in an availability
# zone
#-----------------------------------------

# For private networks in zone A
module "aws_private_route_table_za" {
  source = "./modules/aws/network/route/table"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_private_route_table_za_name
}

#For private networks in zone B
module "aws_private_route_table_zb" {
  source = "./modules/aws/network/route/table"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_private_route_table_zb_name
}

# Associate private networks in zone A to private route table
resource "aws_route_table_association" "route_sn_za_pro_pri_34" {
  subnet_id      = module.aws_sn_za_pro_pri_34.id
  route_table_id = module.aws_private_route_table_za.id
}

# Associate private networks in zone B to private route table
resource "aws_route_table_association" "aws_sn_zb_pro_pri_38" {
  subnet_id      = module.aws_sn_zb_pro_pri_38.id
  route_table_id = module.aws_private_route_table_zb.id
}
