# Copyright (C) 2018 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.


#---------------------------------------------
# SECURITY - Default group
# Allows access from Internet to SSH Port
# Ideally it should be a single public IP
# Allows access to Internet from instances
#---------------------------------------------

  # Group
  module "aws_sec_group_ec2_default" {
    source      = "./modules/aws/security/group"
    vpc_id      = "${module.aws_network_vpc.id}"
    name        = "${var.aws_sec_group_ec2_default["sec_name"]}"
    description = "${var.aws_sec_group_ec2_default["sec_description"]}"
    allow_all_outbound = "${var.aws_sec_group_ec2_default["allow_all_outbound"]}"
  }

  # Rules
  # Access from My IP to SSH Port
  module "sec_rule_ec2_default_internet_to_ssh" {
    source            = "./modules/aws/security/rule/cidr_blocks"
    security_group_id = "${module.aws_sec_group_ec2_default.id}"
    type              = "${var.sec_rule_ec2_default_internet_to_ssh["type"]}"
    from_port         = "${var.sec_rule_ec2_default_internet_to_ssh["from_port"]}"
    to_port           = "${var.sec_rule_ec2_default_internet_to_ssh["to_port"]}"
    protocol          = "${var.sec_rule_ec2_default_internet_to_ssh["protocol"]}"
    cidr_blocks       = "${data.external.whatismyip.result["internet_ip"]}/32"
    #"${var.sec_rule_ec2_default_internet_to_ssh["cidr_blocks"]}"
    description       = "${var.sec_rule_ec2_default_internet_to_ssh["description"]}"
  }
