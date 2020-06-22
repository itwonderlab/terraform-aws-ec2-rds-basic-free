# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# Creates an RDS Instance
# See http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
# ---------------------------------------------------

variable identifier {
  description = "The name of the RDS instance"
}

variable allocated_storage {
  description = "The allocated storage in gigabytes."
}

variable storage_type {
  description = "gp2: general purpose SSD"
}

variable final_snapshot_id {
  description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. If omitted, no final snapshot will be made."
}

variable skip_final_snapshot {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted. Default is true."
}

variable copy_tags_to_snapshot {
  description = "(Optional, boolean) On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified). Default false"
  default     = "false"
}

variable engine {
  description = "Valid Values: MySQL | mariadb | oracle-se1 | oracle-se | oracle-ee | sqlserver-ee | sqlserver-se | sqlserver-ex | sqlserver-web | postgres | aurora"
  default     = ""
}

variable engine_version {
  description = "The version number of the database engine to use. MySQL:5.1.73a | 5.1.73b. Oracle 11g: 11.2.0.2.v7, 12c: 12.1.0.1.v1 | 12.1.0.1.v2 | 12.1.0.2.v1"
  default     = ""
}

variable license_model {
  description = "License model information for this DB instance: license-included | bring-your-own-license | general-public-license"
  default     = "bring-your-own-license"
}

variable instance_class {
  default = "db.t2.micro"
}

variable name {
  description = "Mysql: The DB name to create. If omitted, no database is created initially. Oracle: The Oracle System ID (SID) of the created DB instance."
  default     = ""
}

variable password {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}

variable username {
  description = "Username for the master DB user."
}

variable availability_zone {
  description = "(Optional) The AZ for the RDS instance."
}

variable backup_retention_period {
  description = "(Optional) The days to retain backups for. Must be 1 or greater to be a source for a Read Replica."
}

variable backup_window {
  description = "(Optional) The backup window."
  default     = ""
}

variable maintenance_window {
  description = "(Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00. See RDS Maintenance Window docs for more."
  default     = ""
}

variable multi_az {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  default     = "false"
}

variable publicly_accessible {
  description = "(Optional) Bool to control if instance is publicly accessible."
  default     = "false"
}

variable vpc_security_group_ids {
  description = "(Optional) List of VPC security groups to associate."
  type        = list
}

variable db_subnet_group_name {
  description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  default     = ""
}

variable parameter_group_name {
  description = "(Optional) Name of the DB parameter group to associate."
  default     = ""
}

variable storage_encrypted {
  description = "(Optional) Specifies whether the DB instance is encrypted. The default is false if not specified."
  default     = "false"
}

variable apply_immediately {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information."
  default     = "true"
}

variable auto_minor_version_upgrade {
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  default     = true
}

variable allow_major_version_up {
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  default     = false
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

variable "tag_cost_center" {
      description = "(Mandatory) Cost Center for billing"
}
