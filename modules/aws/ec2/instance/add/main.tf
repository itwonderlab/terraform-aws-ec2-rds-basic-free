# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-------------------------
# EC2 Instance(s)
#-------------------------

resource "aws_instance" "default" {

  # (Required) The AMI to use for the instance.
  ami = var.ami

  # (Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance.
  instance_type = var.instance_type

  #(Optional) The AZ to start the instance in.
  availability_zone = var.availability_zone

  #(Optional) If true, the launched EC2 instance will be EBS-optimized.
  ebs_optimized = var.ebs_optimized

  #(Optional) If true, enables EC2 Instance Termination Protection
  disable_api_termination = var.disable_api_termination

  #(Optional) Shutdown behavior for the instance
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  # The key name to use for the instance.
  key_name = var.key_name

  # (Optional) If true, enable detailed monitoring enabled
  monitoring = var.monitoring

  #(Optional) A list of security group IDs to associate with.
  vpc_security_group_ids = var.vpc_security_group_ids

  #(Optional) The VPC Subnet ID to launch in.
  subnet_id = var.subnet_id

  #(Optional) Associate a public ip address with an instance in a VPC.
  associate_public_ip_address = var.associate_public_ip_address

  #(Optional) Private IP address to associate with the instance in a VPC.
  private_ip = var.private_ip

  #(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true.
  source_dest_check = var.source_dest_check

  #(Optional) The user data to provide when launching the instance.
  user_data = var.user_data

  #(Optional) The IAM Instance Profile to launch the instance with.
  iam_instance_profile = var.iam_instance_profile

  volume_tags            = var.volume_tags

  root_block_device {
    volume_size           = var.root_block_device["volume_size"]
    volume_type           = var.root_block_device["volume_type"]
    delete_on_termination = var.root_block_device["delete_on_termination"]
  }

  /*
  ebs_block_device       = var.ebs_block_device
  ephemeral_block_device = var.ephemeral_block_device
  */

  tags = merge(
    var.instance_tags,
    {
      "private_name" = var.tag_private_name,
      "public_name"  =  var.tag_public_name,
      "environment"  =  var.tags_environment,
      "app"          =  var.tag_app,
      "app_id"       =  var.tag_app_id,
      "os"           =  var.tag_os,
      "os_id"        =  var.tag_os_id,
      "cost_center"  =  var.tag_cost_center
    }
    )

    lifecycle {
        ignore_changes = [ami]
    }

}

resource "aws_route53_record" "private" {
  zone_id = var.route53_private_zone_id
  name    = var.tag_private_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.default.private_ip]
  for_each = local.register_dns_private_each
}

resource "aws_route53_record" "public" {
  zone_id = var.route53_public_zone_id
  name    = var.tag_public_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.default.public_ip]
  for_each = local.register_dns_public_each
}
