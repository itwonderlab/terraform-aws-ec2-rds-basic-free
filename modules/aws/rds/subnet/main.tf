# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates an RDS Subnet
# ---------------------------------------------------

resource "aws_db_subnet_group" "default" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids //[split(",", var.subnet_ids)]

  tags = {
    Name = var.name
  }
}
