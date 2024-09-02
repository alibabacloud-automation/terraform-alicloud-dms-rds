variable "name" {
  default = "tf-example"
}

data "alicloud_account" "current" {}
data "alicloud_regions" "default" {
  current = true
}
data "alicloud_dms_user_tenants" "default" {
  status = "ACTIVE"
}

data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_db_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}


module "example" {
  source = "../.."

  # db_instance
  db_engine_version = "8.0"
  db_type           = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  db_storyge        = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  db_storage_type   = "cloud_essd"
  vswitch_id        = alicloud_vswitch.default.id
  db_security_ips   = ["100.104.5.0/24", "192.168.0.6"]

  # dms_enterprise_instance
  dms_tid       = data.alicloud_dms_user_tenants.default.ids.0
  dms_safe_rule = "904496"
  dms_dba_uid   = data.alicloud_account.current.id
  dms_use_dsql  = 1
  region        = data.alicloud_regions.default.regions.0.id
}


