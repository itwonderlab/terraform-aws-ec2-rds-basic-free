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

# The ID of the security group rule
output "id" {
  value = aws_security_group_rule.default.id
}
