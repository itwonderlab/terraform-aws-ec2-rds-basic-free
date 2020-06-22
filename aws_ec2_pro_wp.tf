# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# Word Press Server
#-------------------------

# SECURITY
  # Group
  module "aws_sg_ec2_pro_pub_wp_01" {
    source      = "./modules/aws/security/group"
    vpc_id      = module.aws_network_vpc.id
    name        = var.aws_sg_ec2_pro_pub_wp_01["sec_name"]
    description = var.aws_sg_ec2_pro_pub_wp_01["sec_description"]
  }

  # Rules

  # Access from Internet to port 80 (for redirection)
  module "aws_sr_ec2_pro_pub_wp_01_internet_to_80" {
    source            = "./modules/aws/security/rule/cidr_blocks"
    security_group_id = module.aws_sg_ec2_pro_pub_wp_01.id
    type              = var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["type"]
    from_port         = var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["from_port"]
    to_port           = var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["to_port"]
    protocol          = var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["protocol"]
    cidr_blocks       = [var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["cidr_blocks"]]
    description       = var.aws_sr_ec2_pro_pub_wp_01_internet_to_80["description"]
  }

  # Access from Internet to port 443
  module "aws_sr_ec2_pro_pub_wp_01_internet_to_443" {
    source            = "./modules/aws/security/rule/cidr_blocks"
    security_group_id = module.aws_sg_ec2_pro_pub_wp_01.id
    type              = var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["type"]
    from_port         = var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["from_port"]
    to_port           = var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["to_port"]
    protocol          = var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["protocol"]
    cidr_blocks       = [var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["cidr_blocks"]]
    description       = var.aws_sr_ec2_pro_pub_wp_01_internet_to_443["description"]
  }


  # Create WP instance
  module "aws_ec2_pro_pub_wp_01" {
    source            = "./modules/aws/ec2/instance/add"
    name              = var.aws_ec2_pro_pub_wp_01["name"]
    ami               = data.aws_ami.ubuntu1604.id
    instance_type     = var.aws_ec2_pro_pub_wp_01["instance_type"]
    availability_zone = var.aws_ec2_pro_pub_wp_01["availability_zone"]
    key_name          = var.aws_ec2_pro_pub_wp_01["key_name"]
    disable_api_termination = var.is_production ? true : false
    vpc_security_group_ids = [module.aws_sg_ec2_default.id,module.aws_sg_ec2_pro_pub_wp_01.id]
    subnet_id         = module.aws_sn_za_pro_pub_32.id
    associate_public_ip_address = var.aws_ec2_pro_pub_wp_01["associate_public_ip_address"]
    instance_tags     = {}
    tag_private_name  = var.aws_ec2_pro_pub_wp_01["tag_private_name"]
    tag_public_name   = var.aws_ec2_pro_pub_wp_01["tag_public_name"]
    tag_app           = var.aws_ec2_pro_pub_wp_01["tag_app"]
    tag_app_id        = var.aws_ec2_pro_pub_wp_01["tag_app_id"]
    tag_os            = var.aws_ec2_pro_pub_wp_01["tag_os"]
    tag_os_id         = var.aws_ec2_pro_pub_wp_01["tag_os_id"]
    tags_environment  = var.aws_ec2_pro_pub_wp_01["tags_environment"]
    tag_cost_center   = var.aws_ec2_pro_pub_wp_01["tag_cost_center"]

    register_dns_private = true
    route53_private_zone_id = module.aws_route53_public.id

    register_dns_public = true
    route53_public_zone_id = module.aws_route53_public.id

    root_block_device = {
      volume_size           = var.aws_ec2_pro_pub_wp_01["root_block_device_size"]
      volume_type           = var.aws_ec2_pro_pub_wp_01["root_block_device_volume_type"]
      delete_on_termination = var.is_production ? false : true #If production, Do not delete!
    }

    volume_tags       = {
      Name = var.aws_ec2_pro_pub_wp_01["name"]
    }

    ignore_changes = ["ami"]

  }
