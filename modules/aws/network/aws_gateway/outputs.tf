# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates an AWS VPN Gateway
# ---------------------------------------------------

output "vpn_gateway_id" {
  value = aws_vpn_gateway.default.id
}
