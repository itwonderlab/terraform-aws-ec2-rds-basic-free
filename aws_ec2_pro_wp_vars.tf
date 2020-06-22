# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# Word Press Server
#-------------------------

variable "aws_ec2_pro_pub_wp_01" {
  description = "Server for Word Press, Env: PRO"
  type        = map
}

variable "aws_sg_ec2_pro_pub_wp_01" {
  description = "Security group for Word Press Server, Env: PRO "
  type        = map
}

variable "aws_sr_ec2_pro_pub_wp_01_internet_to_80" {
  description = "Access from Internet to port 80"
  type        = map
}

variable "aws_sr_ec2_pro_pub_wp_01_internet_to_443" {
  description = "Access from Internet to port 443"
  type        = map
}
