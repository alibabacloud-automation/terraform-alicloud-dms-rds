Terraform module which managing RDS by DMS on Alibaba Cloud

terraform-alicloud-dms-rds
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云的 VPC 下创建一个RDS数据库, 并创建DMS实例对数据库进行管理

本 Module 支持创建以下资源:

* [alicloud_vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc)
* [alicloud_vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alicloud_vswitch)
* [alicloud_db_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alicloud_db_instance)
* [alicloud_db_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alicloud_db_account)
* [alicloud_dms_enterprise_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alicloud_dms_enterprise_instance)

## 用法

```hcl
module "dms-rds" {
  source            = "terraform-alicloud-modules/dms-rds/alicloud"
  region            = "cn-hangzhou"
  db_type           = "rds.mysql.t1.small"
  db_account        = "terraformTest"
  db_password       = "Helloworld996!"
}
```

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.81.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
