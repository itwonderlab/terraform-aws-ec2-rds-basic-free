# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# Default provider: AWS
#-----------------------------------------

provider "aws" {
  shared_credentials_file = pathexpand(var.provider_default_aws_shared_credentials_file)
  profile                 = var.provider_default_aws_profile
  region                  = var.provider_default_aws_region
  allowed_account_ids     = var.provider_default_aws_account_id
  version                 = "~> 2.0"
}
