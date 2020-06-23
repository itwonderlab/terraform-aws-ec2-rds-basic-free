# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#------------------------
# MAIN
#------------------------

is_production = false

#------------------------
# PROVIDERS
#------------------------

  # DEFAULT AWS
  provider_default_aws_profile    = "ditwl_infradmin"
  provider_default_aws_region     = "us-east-1" #US East (N. Virginia), Cheapests region as https://www.concurrencylabs.com/blog/choose-your-aws-region-wisely/
  provider_default_aws_account_id = [""]
  provider_default_aws_shared_credentials_file = "~/.aws/credentials"
  provider_default_aws_key_file = "~/keys/ditwl_kp_infradmin.pem"

#------------------------
# VPC
#------------------------

  aws_vpc_tag_name  = "ditwl-vpc"
  aws_vpc_block     = "172.17.32.0/19" #172.17.32.1 - 172.17.63.254

#------------------------
# SUBNETS
#------------------------

  #------------------------
  # For EC2 instances
  #------------------------

    #Zone: A, Env: PRO, Type: PUBLIC, Code: 32
    aws_sn_za_pro_pub_32={
      cidr   ="172.17.32.0/23" #172.17.32.1 - 172.17.33.254
      name   ="ditwl-sn-za-pro-pub-32"
      az     ="us-east-1a"
      public = "true"
    }

    #Zone: A, Env: PRO, Type: PRIVATE, Code: 34
    aws_sn_za_pro_pri_34={
      cidr   = "172.17.34.0/23" #172.17.34.1 - 172.17.35.254
      name   = "ditwl-sn-za-pro-pri-34"
      az     = "us-east-1a"
      public = "false"
    }

    #Zone: B, Env: PRO, Type: PUBLIC, Code: 36
    aws_sn_zb_pro_pub_36={
      cidr   = "172.17.36.0/23" #172.17.36.1 - 172.17.37.254
      name   = "ditwl-sn-zb-pro-pub-36"
      az     = "us-east-1b"
      public = "false"
    }

    #Zone: B, Env: PRO, Type: PRIVATE, Code: 38
    aws_sn_zb_pro_pri_38={
      cidr   = "172.17.38.0/23" #172.17.38.1 - 172.17.39.254
      name   = "ditwl-sn-zb-pro-pri-38"
      az     = "us-east-1b"
      public = "false"
    }

    #------------------------
    # For RDS instances
    #------------------------
    aws_rds_sn_pub_pro_01 = {
      name        = "ditwl-rds-sn-pub-pro-01"
      description = "ditwl-RDS-SN-pub-PRO-01"

      #See aws_rds_sn_pro.tf for subnet_ids
      #subnet_ids  = ${module.aws_sn_za_pro_pub_32.id},${module.aws_sn_zb_pro_pub_36.id
    }


#------------------------
# VPC ROUTING
#------------------------

aws_main_route_table_name = "ditwl-rt-pub-main"
aws_internet_gw_name = "ditwl-igw-pub"
aws_internet_route = {
  name = "ditwl-ir"
  destination_cidr_block = "0.0.0.0/0"
}
aws_private_route_table_za_name = "ditwl-rt-pri-za"
aws_private_route_table_zb_name = "ditwl-rt-pri-zb"


#------------------------
# ROUTE53
#------------------------

  #------------------------
  # PUBLIC - PRO
  #------------------------

  aws_route53_delegation_set_reference_name = "ditwl-r53-del"

  aws_route53_public = {
    name          = "demo.itwonderlab.com"
    comment       = "ditwl - Public DNS"
    tags_environment   = "pro"
  }


#------------------------
# SECURITY
#------------------------

  #------------------------
  # Default EC2
  #------------------------
  aws_sg_ec2_default = {
    sec_name        = "ditwl-sg-ec2-def"
    sec_description = "ditwl - Default Security Group - Env: PRO"
    allow_all_outbound = true
  }
    #------------------------
    # Allow SSH from my Internet IP to ...
    #------------------------
    aws_sr_ec2_default_internet_to_ssh = {
      type              = "ingress"
      from_port         = "22"
      to_port           = "22"
      protocol          = "tcp"
      cidr_blocks       = "" #data.external.whatismyip.result["internet_ip"]}/32"
      description       = "Access from Internet to SSH port"
    }

    #------------------------
    # Default RDS
    #------------------------
    aws_sg_rds_mariadb_default = {
      sec_name        = "ditwl-sg-rds-mariadb-def"
      sec_description = "ditwl - Default Security Group RDS MariaDB"
      allow_all_outbound = true
    }
      #------------------------
      # Allow access from my Internet IP to DB port
      #------------------------
      aws_sr_rds_mariadb_default_internet_to_db_port = {
        type              = "ingress"
        from_port         = "3306"
        to_port           = "3306"
        protocol          = "tcp"
        cidr_blocks       = "" #data.external.whatismyip.result["internet_ip"]}/32"
        description       = "Access from My Internet IP to DB port"
      }



#------------------------
# RDS INSTANCES
#------------------------

  #------------------------
  # MariaDB PRO 01
  #------------------------
  aws_rds_mariadb_pro_pub_01 = {
    identifier              = "ditwl-rds-mariadb-pro-pub-01"
    allocated_storage       = 20 #GB
    storage_type            = "gp2"
    final_snapshot_id       = "ditwl-rds-mariadb-pro-pub-01-final"
    skip_final_snapshot     = false
    engine                  = "mariadb"
    engine_version          = "10.2.11"
    instance_class          = "db.t2.micro"
    password                = "*************"
    username                = "ditwlRDSPROdb01" #Start with a letter. Only numbers, letters, and _ accepted, 1 to 16 characters long
    availability_zone       = "us-east-1a"
    backup_retention_period = 5
    #db_subnet_group_name   = See var aws_rds_sn_pro_01["name"]
    multi_az                = false
    vpc_security_group_ids  = ""
    parameter_group_name    = ""
    allow_major_version_up  = false
    publicly_accessible     = true
    tag_private_name        = "ditwl-rds-mariadb-pro-pub-01"
    tag_public_name         = "ditwl-rds-mariadb-pro-pub-01"
    tag_app                 = "mariadb"
    tag_app_id              = "mariadb-01"
    tag_os                  = "rds"
    tags_environment        = "pro"
    tag_cost_center         = "ditwl-permanent"
  }

  #------------------------
  # RDS Security Group
  #------------------------
  aws_sg_rds_mariadb_pro_pub_01 = {
    sec_name        = "ditwl-aws-sg-rds-mariadb-pro-pub-01"
    sec_description = "ditwl - MariaDb server access rules - Pub, Env: PRO"
    allow_all_outbound = false
  }
    #------------------------
    # Allow access from my Instances to DB port
    #------------------------
    aws_sr_rds_mariadb_pro_pub_01_instances_to_db_port = {
      type              = "ingress"
      from_port         = "3306"
      to_port           = "3306"
      protocol          = "tcp"
      #source_security_group_id module.aws_sec_group_ec2_default.id
      description       = "Access from Instances to DB port"
    }


#------------------------
# EC2 INSTANCES
#------------------------

    #------------------------
    # WP PRO
    #------------------------

  aws_ec2_pro_pub_wp_01 = {
    name              = "ditwl-ec2-pro-pub-wp01"
    ami               = "" #Uses data.aws_ami.ubuntu1604.id
    instance_type     = "t2.micro" #AWS Free Tier: 750 hours per month of Linux, RHEL, or SLES t2.micro instance usage
    availability_zone = "us-east-1a"
    key_name          = "ditwl_kp_infradmin"
    # vpc_security_group_ids = SEE TF file
    # subnet_id         = SEE TF file
    associate_public_ip_address = true

    root_block_device_size        = 8

    # See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html
    root_block_device_volume_type = "gp2"

    tag_private_name  = "ditwl-ec2-pro-pub-wp-01"
    tag_public_name   = "www"
    tag_app           = "wp"
    tag_app_id        = "wp-01"
    tag_os            = "ubuntu"
    tag_os_id         = "ubuntu-16"
    tags_environment  = "pro"
    tag_cost_center   = "ditwl-permanent"
    tags_volume       = "ditwl-ec2-pro-pub-wp-01-root"

  }

  #------------------------
  # WP PRO Security Group
  #------------------------
  aws_sg_ec2_pro_pub_wp_01 = {
    sec_name        = "ditwl-sg-ec2-pro-pub-01"
    sec_description = "ditwl - WP server access rules - Pub, Env: PRO"
    allow_all_outbound = false
  }

  aws_sr_ec2_pro_pub_wp_01_internet_to_80 = {
    type              = "ingress"
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = "0.0.0.0/0"
    description       = "Access from Internet to port 80"
  }

  aws_sr_ec2_pro_pub_wp_01_internet_to_443 = {
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = "0.0.0.0/0"
    description       = "Access from Internet to port 443"
  }
