# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates a VPC
# ---------------------------------------------------

resource "aws_vpc" "default" {
  cidr_block           = var.aws_vpc_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_tag_name
  }
}
