# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#----------------------
# ROUTE 53 (DNS)
#----------------------

  #------------------------
  # Public: Zone to be used
  # Outside the VPC
  #------------------------

  variable "aws_route53_delegation_set_reference_name" {
    description = "Name of Reusable Delegation Sets for Route 53"
  }

  variable "aws_route53_public" {
    description = "Route 53 for public VPC DNS"
    type        = map
  } # public
