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

# The ID of the security group rule
output "id" {
  value = aws_security_group_rule.default.id
}
