# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates an RDS Subnet
# ---------------------------------------------------

variable name {
  description = "name - (Required) The name of the DB subnet group"
}

variable description {
  description = "(Required) The description of the DB subnet group."
}

variable subnet_ids {
  description = "(Required) A list of VPC subnet IDs."
}
