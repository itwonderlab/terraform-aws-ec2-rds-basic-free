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
#Specifying a Required Terraform Version
# cannot contain interpolations, see terraform.tf

variable "is_production" {
  description = "The infrastructure is in production?. If true api_termination will be disabled"
  default = true
}
