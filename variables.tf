variable "region" {
  description = "The region of resources"
  type        = string
}

variable "vswitch_id" {
  description = "The id of vswtich."
  type        = string
  default     = null
}


variable "db_engine" {
  description = "Database type. Value options: MySQL, SQLServer, PostgreSQL, and PPAS."
  type        = string
  default     = "MySQL"
}

variable "db_engine_version" {
  description = "Database version."
  type        = string
  default     = "5.7"
}

variable "db_type" {
  description = "DB Instance type. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  type        = string
  default     = "rds.mysql.t1.small"
}

variable "db_storyge" {
  description = "User-defined DB instance storage space."
  type        = string
  default     = "10"
}

variable "db_storage_type" {
  description = "The DB instance storage type."
  type        = string
  default     = "cloud_essd"
}

variable "db_name" {
  description = "The name of DB instance. It a string of 2 to 256 characters."
  type        = string
  default     = "tf-testAccDbName"
}

variable "db_security_ips" {
  description = "List of IP addresses allowed to access all databases of an instance. "
  type        = list(string)
  default     = ["100.104.5.0/24", "192.168.0.6", "100.104.205.0/24"]
}

variable "db_account" {
  description = "The account of db"
  type        = string
  default     = "tftestnormal"
}


variable "db_password" {
  description = "The password of db."
  type        = string
  default     = "Helloworld996!"
}

variable "db_account_type" {
  description = "The account requiring a uniqueness check. "
  type        = string
  default     = "Normal"
}

variable "dms_safe_rule" {
  description = "The security rule of the instance is passed into the name of the security rule in the enterprise."
  type        = string
  default     = "自由操作"
}

variable "dms_env_type" {
  description = "Environment type. Valid values: `product` production environment, `dev` development environment, `pre` pre-release environment, `test` test environment, `sit` SIT environment, `uat` UAT environment, `pet` pressure test environment, `stag` STAG environment."
  type        = string
  default     = "test"
}

variable "dms_query_time" {
  description = "Query timeout time, unit: s (seconds)."
  type        = string
  default     = "70"
}

variable "dms_export_timeout" {
  description = "Export timeout, unit: s (seconds)."
  type        = string
  default     = "2000"
}

variable "dms_ddl_online" {
  description = "Whether to use online services, currently only supports MySQL and PolarDB. Valid values: `0` Not used, `1` Native online DDL priority, `2` DMS lock-free table structure change priority."
  type        = string
  default     = "0"
}

variable "dms_use_dsql" {
  description = "Whether to enable cross-instance query. Valid values: `0` not open, `1` open."
  type        = number
  default     = 0
}

variable "dms_data_link_name" {
  description = "Cross-database query datalink name."
  type        = string
  default     = ""
}

variable "dms_tid" {
  description = "The tenant ID. "
  type        = string
  default     = null
}

variable "dms_dba_uid" {
  description = "The DBA ID of the instance. "
  type        = string
  default     = null
}

variable "dms_instance_type" {
  description = "The instance type of the DMS instance. "
  type        = string
  default     = "mysql"
}
