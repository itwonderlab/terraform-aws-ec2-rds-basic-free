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

resource "aws_security_group_rule" "default" {
  security_group_id        = var.security_group_id
  type                     = var.type
  from_port                = var.from_port
  to_port                  = var.to_port
  protocol                 = var.protocol
  source_security_group_id = var.source_security_group_id
  description              = var.description
}
