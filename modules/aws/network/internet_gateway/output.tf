# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Create Internet Gateways for VPC
# ---------------------------------------------------

output "id" {
  value = aws_internet_gateway.default.id
}
