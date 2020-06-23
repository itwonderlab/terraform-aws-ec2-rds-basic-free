# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# SUBNET for RDS
#----------------------

  #----------------------
  # PRO
  #----------------------
  module "aws_rds_sn_pub_pro_01" {
    source      = "./modules/aws/rds/subnet"
    name        = var.aws_rds_sn_pub_pro_01["name"]
    description = var.aws_rds_sn_pub_pro_01["description"]

    # Add 2 PRIVATE Subnets from two availability zones
    subnet_ids  = [module.aws_sn_za_pro_pub_32.id, module.aws_sn_zb_pro_pub_36.id]
    # Add 1 PRIVATE Subnets from two availability zones
    #subnet_ids  = [module.aws_sn_za_pro_pub_32.id]
  }
