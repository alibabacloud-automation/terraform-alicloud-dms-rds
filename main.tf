data "alicloud_account" "current" {}

resource "alicloud_vpc" "default" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

data "alicloud_zones" "default" {}

resource "alicloud_vswitch" "default" {
  name              = var.vswtich_name
  cidr_block        = var.vswitch_cidr_block
  vpc_id            = alicloud_vpc.default.id
  availability_zone = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_db_instance" "instance" {
  engine           = var.db_engine
  engine_version   = var.db_engine_version
  instance_type    = var.db_type
  instance_storage = var.db_storyge
  vswitch_id       = alicloud_vswitch.default.id
  instance_name    = var.db_name
  security_ips     = var.db_security_ips
}

resource "alicloud_db_account" "account" {
  instance_id = alicloud_db_instance.instance.id
  name        = var.db_account
  password    = var.db_password
  type        = var.db_account_type
}

resource "alicloud_dms_enterprise_instance" "default" {
  dba_uid           = tonumber(data.alicloud_account.current.id)
  host              = alicloud_db_instance.instance.connection_string
  port              = "3306"
  network_type      = "VPC"
  safe_rule         = var.dms_safe_rule
  tid               = var.dms_tid
  instance_type     = alicloud_db_instance.instance.engine
  instance_source   = "RDS"
  env_type          = var.dms_env_type
  database_user     = alicloud_db_account.account.name
  database_password = alicloud_db_account.account.password
  instance_alias    = var.db_name
  query_timeout     = var.dms_query_time
  export_timeout    = var.dms_export_timeout
  ecs_region        = var.region
  ddl_online        = var.dms_ddl_online
  use_dsql          = var.dms_use_dsql
  data_link_name    = var.dms_data_link_name
}