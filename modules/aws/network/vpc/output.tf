# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates a VPC
# ---------------------------------------------------

output "id" {
  value = aws_vpc.default.id
}

output "vpc_main_route_table_id" {
  value = aws_vpc.default.main_route_table_id
}
