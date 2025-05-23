output "this_dms_id" {
  value       = alicloud_dms_enterprise_instance.default.id
  description = "The ID of the DMS Enterprise instance."
}

output "this_db_id" {
  value       = alicloud_db_instance.instance.id
  description = "The ID of the RDS instance."
}
