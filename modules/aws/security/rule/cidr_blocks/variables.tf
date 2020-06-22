# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# SECURITY Rule
# Ingress or egress rule defined by:
# Port: the port/s being opened
# Source: cidr_blocks
# ---------------------------------------------------

variable security_group_id {}

#(Required) The type of rule being created. Valid options are ingress (inbound) or egress (outbound).
variable type {
  default = "inbound"
}

#(Required) The start port (or ICMP type number if protocol is "icmp").
variable from_port {}

#(Required) The end port (or ICMP code if protocol is "icmp").
variable to_port {}

# (Required) The protocol. If not icmp, tcp, udp, or all use the protocol number
variable protocol {
  default = "tcp"
}

# Allowed cidr_blocks
variable cidr_blocks {
  type = list
}

# Description of the rule.
variable description {}
