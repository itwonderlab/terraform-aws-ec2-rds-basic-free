# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#------------------------
# ROUTE 53 (DNS)
#------------------------

  #------------------------
  # Public
  #------------------------

  module "aws_route53_delegation_set" {
    source  = "./modules/aws/route53/delegation_set"
    reference_name    = var.aws_route53_delegation_set_reference_name
  }

  module "aws_route53_public" {
    source  = "./modules/aws/route53/public_zone"
    name    = var.aws_route53_public["name"]
    delegation_set_id = module.aws_route53_delegation_set.id

    comment = var.aws_route53_public["comment"]

    #TAGS
    tags_environment = var.aws_route53_public["tags_environment"]
    
  }
