# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.


#-------------------------
# EC2 Instance(s)
#-------------------------

variable "ami" {
  description = "(Required) The AMI to use for the instance."
}

variable "instance_count" {
  description = "Number of instances"
  default     = 1
}

variable "instance_type" {
  description = ""
  default     = "t2.nano"
}

variable "name" {
  description = ""
}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in."
  default     = ""
}

variable "placement_group" {
  description = "(Optional) The Placement Group to start the instance in."
  default     = ""
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized."
  default     = false
}

variable "disable_api_termination" {
  description = "Optional) If true, enables EC2 Instance Termination Protection"
  default     = true
}

variable "instance_initiated_shutdown_behavior" {
  description = "(Optional) Shutdown behavior for the instance."
  default     = "stop"
}

variable "key_name" {
  description = "The key name to use for the instance. "
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = "false"
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of security group IDs to associate with. "
  type        = list
}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in."
  default     = ""
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC."
  default     = false
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC."
  default     = ""
}

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
  default     = true
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. "
  default     = ""
}

variable "iam_instance_profile" {
  description = "(Optional) The IAM Instance Profile to launch the instance with. "
  default     = ""
}

variable "instance_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "tag_private_name" {
  description = "(Mandatory) DNS internal resource name."
}

variable "tag_public_name" {
    description = "(Optional) DNS external resource name."
    default     = ""
}
variable "tags_environment" {
  description = "(Mandatory) Environment"
  default     = ""
}
variable "tag_app" {
  description = "(Mandatory) Application name"
}
variable "tag_app_id" {
    description = "(Mandatory) Application ID"
}
variable "tag_os" {
      description = "(Mandatory) Operating System"
}
variable "tag_os_id" {
      description = "(Mandatory) Operating System ID"
}
variable "tag_cost_center" {
      description = "(Mandatory) Cost Center for billing"
}

variable "volume_tags" {
  description = "(Optional) A mapping of tags to assign to the devices created by the instance at launch time."
  default     = {}
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance"
  default     = {}
}

variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance"
  default     = []
}

variable "ephemeral_block_device" {
  description = "(Optional) Additional ephemeral block devices to attach to the instance"
  default     = []
}

variable "register_dns_private" {
  description = "(Optional) Register in private DNS using tag_private_name and private IP"
  type = bool
  default = true
}

variable "route53_private_zone_id" {
  description = "(Optional) Register in private DNS using tag_private_name"
  default = "SET_PRIVATE_ZONE_ID"
}

variable "register_dns_public" {
  description = "(Optional) Register in private DNS using tag_public_name and public IP"
  type = bool
  default = false
}

variable "route53_public_zone_id" {
  description = "(Optional) Register in private DNS using tag_public_name"
  default = ""
}

variable "ignore_changes" {
  description = "(Optional) A list of properties for ignore_changes in lifecycle"
  type        = list
  default     = []
}

locals{
    register_dns_public_each =  tomap({"is" = var.register_dns_public})
    register_dns_private_each =  tomap({"is" = var.register_dns_private})
}

