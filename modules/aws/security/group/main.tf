# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Security Groups
# ---------------------------------------------------

# Add security group
resource "aws_security_group" "default" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${var.name}"
  }

}

# If allow_all_outbound is true, add a rule to allow all outbound
# traffic to Internet
resource "aws_security_group_rule" "all_outbund" {
  security_group_id = "${aws_security_group.default.id}"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
  count             = "${var.allow_all_outbound}"
}
