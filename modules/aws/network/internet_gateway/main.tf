# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Create Internet Gateways for VPC
# ---------------------------------------------------

resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}
