# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates subnets in a given PVC
# ---------------------------------------------------

resource "aws_subnet" "default" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr
  availability_zone       = var.az
  map_public_ip_on_launch = var.public

  tags = {
    Name = var.name
  }
}
