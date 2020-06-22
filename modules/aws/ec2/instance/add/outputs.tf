# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# EC2 Instance(s)
#-------------------------

output "id" {
  description = "The instance IDs"
  value       = [aws_instance.default.*.id]
}

output "availability_zone" {
  description = "The availability zone of the instances"
  value       = [aws_instance.default.*.availability_zone]
}
