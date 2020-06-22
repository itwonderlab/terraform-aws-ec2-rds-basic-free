# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.


#-----------------------------------------
# Zones
#-----------------------------------------

#Zone: A, Env: PRO, Type: PUBLIC, Code: 32
module "aws_sn_za_pro_pub_32" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pub_32["cidr"]
  name   = var.aws_sn_za_pro_pub_32["name"]
  az     = var.aws_sn_za_pro_pub_32["az"]
  public = var.aws_sn_za_pro_pub_32["public"]
}

#Zone: A, Env: PRO, Type: PRIVATE, Code: 34
module "aws_sn_za_pro_pri_34" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pri_34["cidr"]
  name   = var.aws_sn_za_pro_pri_34["name"]
  az     = var.aws_sn_za_pro_pri_34["az"]
  public = var.aws_sn_za_pro_pri_34["public"]
}

#Zone: B, Env: PRO, Type: PUBLIC, Code: 36
module "aws_sn_zb_pro_pub_36" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pub_36["cidr"]
  name   = var.aws_sn_zb_pro_pub_36["name"]
  az     = var.aws_sn_zb_pro_pub_36["az"]
  public = var.aws_sn_zb_pro_pub_36["public"]
}

#Zone: B, Env: PRO, Type: PRIVATE, Code: 38
module "aws_sn_zb_pro_pri_38" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pri_38["cidr"]
  name   = var.aws_sn_zb_pro_pri_38["name"]
  az     = var.aws_sn_zb_pro_pri_38["az"]
  public = var.aws_sn_zb_pro_pri_38["public"]
}
