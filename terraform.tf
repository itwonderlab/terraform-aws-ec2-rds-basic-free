# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# Terraform defaults
#-----------------------------------------

# Configures the behavior of Terraform itself
# only allowed configurations within this block are required_version and backend.
# Detail: https://www.terraform.io/docs/configuration/terraform.html

terraform {
  required_version = "~> 0.12" #cannot contain interpolations. Means requiered version >= 0.12 and < 0.13
}
