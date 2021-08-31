variable "region" {
  default = "cn-huhehaote"
}

variable "profile" {
  default = "default"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

module "example" {
  source = "../"
  region = var.region
}


