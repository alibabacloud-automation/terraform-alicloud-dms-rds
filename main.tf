resource "alicloud_db_instance" "instance" {
  engine                   = var.db_engine
  engine_version           = var.db_engine_version
  instance_type            = var.db_type
  instance_storage         = var.db_storyge
  db_instance_storage_type = var.db_storage_type
  vswitch_id               = var.vswitch_id
  instance_name            = var.db_name
  security_ips             = var.db_security_ips
}

resource "alicloud_rds_account" "account" {
  db_instance_id   = alicloud_db_instance.instance.id
  account_name     = var.db_account
  account_password = var.db_password
  account_type     = var.db_account_type
}

resource "alicloud_dms_enterprise_instance" "default" {
  dba_uid           = var.dms_dba_uid
  host              = alicloud_db_instance.instance.connection_string
  port              = 3306
  network_type      = "VPC"
  safe_rule         = var.dms_safe_rule
  tid               = var.dms_tid
  instance_type     = var.dms_instance_type
  instance_source   = "RDS"
  env_type          = var.dms_env_type
  database_user     = alicloud_rds_account.account.account_name
  database_password = alicloud_rds_account.account.account_password
  instance_name     = var.db_name
  query_timeout     = var.dms_query_time
  export_timeout    = var.dms_export_timeout
  ecs_region        = var.region
  ddl_online        = var.dms_ddl_online
  use_dsql          = var.dms_use_dsql
  data_link_name    = var.dms_data_link_name
}
