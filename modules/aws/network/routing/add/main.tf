# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Adds a route to a routing table
# ---------------------------------------------------

resource "aws_route" "default" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
}
