# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# SUBNETS
# ---------------------------------------------------

#Zone: A, Env: PRO, Type: PUBLIC, Code: 32
variable "aws_sn_za_pro_pub_32" {
  description = "Zone: A, Env: PRO, Type: PUBLIC, Code: 32"
  type        = map
}
#Zone: A, Env: PRO, Type: PRIVATE, Code: 34
variable "aws_sn_za_pro_pri_34" {
  description = "Zone: A, Env: PRO, Type: PRIVATE, Code: 34"
  type        = map
}

#Zone: B, Env: PRO, Type: PUBLIC, Code: 36
variable "aws_sn_zb_pro_pub_36" {
  description = "Zone: B, Env: PRO, Type: PUBLIC, Code: 36"
  type        = map
}
#Zone: B, Env: PRO, Type: PRIVATE, Code: 38
variable "aws_sn_zb_pro_pri_38" {
  description = "Zone: B, Env: PRO, Type: PRIVATE, Code: 38"
  type        = map
}
