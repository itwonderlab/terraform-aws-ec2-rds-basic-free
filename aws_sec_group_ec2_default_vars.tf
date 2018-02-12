# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# SECURITY - Default group
#-------------------------

variable "aws_sec_group_ec2_default" {
  description = "Default Security Group for all instances, Env: PRO"
  type        = "map"
}

variable "sec_rule_ec2_default_internet_to_ssh" {
  description = "Access from Internet IP to SSH port"
  type        = "map"
}
