# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# SECURITY Rule
# Provides a security group rule resource.
# Represents a single ingress or egress group rule,
# which can be added to external Security Groups.
# ---------------------------------------------------

# (Required) The security group to apply this rule to.
variable security_group_id {}

# The type of rule being created. Valid options are ingress (inbound) or egress (outbound).
variable type {
  default = "inbound"
}

# (Required) The start port (or ICMP type number if protocol is "icmp").
variable from_port {}

# (Required) The end port (or ICMP code if protocol is "icmp").
variable to_port {}

# (Required) The protocol. If not icmp, tcp, udp, or all use the protocol number
variable protocol {
  default = "tcp"
}

# (Required) The security group id to allow access to/from, depending on the type.
variable source_security_group_id {}

# (Optional) Description of the rule.
variable description {}
