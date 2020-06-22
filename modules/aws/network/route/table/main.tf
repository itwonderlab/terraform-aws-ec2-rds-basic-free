# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Create a route Table
# ---------------------------------------------------

resource "aws_route_table" "default" {
  vpc_id = var.vpc_id
  propagating_vgws = tolist(var.propagating_vgws)

  tags = {
    Name = var.name
  }
}
