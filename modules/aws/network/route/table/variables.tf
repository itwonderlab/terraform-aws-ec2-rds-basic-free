# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Create a route Table
# ---------------------------------------------------

variable vpc_id {}

variable description {
  default = "Route table"
}

variable propagating_vgws {
    default = []
}

variable name {}
