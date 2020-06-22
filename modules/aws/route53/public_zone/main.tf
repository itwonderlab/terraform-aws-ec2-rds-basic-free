# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# ROUTE 53 (PUBLIC DNS)
# ---------------------------------------------------

resource "aws_route53_zone" "public" {
  name    = var.name
  comment = var.comment
  delegation_set_id = var.delegation_set_id

  tags = {
      Name = var.name
      env = var.tags_environment
    }
}
