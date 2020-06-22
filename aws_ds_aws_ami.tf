# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#--------------------------------------------------------
# Ubuntu AMI
#--------------------------------------------------------
# Use this data source to get the ID of the latests AMI for selected OS
# Use this data source to get the ID of the latests AMI for selected OS
# data.aws_ami.NAME.id

  # Ubuntu 16.04 HVM using EBS SSD
  # registered AMI for use in other resources.

  #----------------------
  # Ubuntu AMI 16.04 LTS
  #----------------------

  data "aws_ami" "ubuntu1604" {
      most_recent = true

      filter {
          name   = "name"
          values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
      }

      # filter {
      #     name   = "virtualization-type"
      #     values = ["hvm"]
      # }

      owners = ["099720109477"] # Canonical
  }
