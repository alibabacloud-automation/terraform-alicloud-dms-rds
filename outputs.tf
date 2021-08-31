output "this_dms_id" {
  value = alicloud_dms_enterprise_instance.default.id
}

output "this_db_id" {
  value = alicloud_db_instance.instance.id
}

output "this_vpc_id" {
  value = alicloud_vpc.default.id
}

output "this_vswitch_id" {
  value = alicloud_vswitch.default.id
}
