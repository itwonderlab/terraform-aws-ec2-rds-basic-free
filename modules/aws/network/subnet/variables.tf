# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates subnets in a given PVC
# ---------------------------------------------------

variable vpc_id {}

variable description {
  default = "Subnet(Zone, #, Type): ?,?,?"
}

variable cidr {}
variable name {}
variable az {}

variable public {
  default = false
}
