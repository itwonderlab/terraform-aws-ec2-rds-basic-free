# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# ROUTE 53 (PUBLIC DNS)
# ---------------------------------------------------

output "id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value = aws_route53_zone.public.zone_id
}
