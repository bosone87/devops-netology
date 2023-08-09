###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image_family"
}

variable "vms_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "yandex_compute_instance_vms_web_standart"
}

variable "vms_web_resources" {
  type        = map
  default     = {
    "web"    = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
  }
  description = "yandex_compute_instance_vms_web_resourses"
}

variable "vms_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "ssh_user"
}

variable "vms_web_resources_4each" {
  type = list(object({ 
    name = string,
    platform_id = string, 
    cpu     = number, 
    ram     = number, 
    disk    = number,
    cf      = number
    }))
  default = [ 
    {
    name = "main"
    platform_id = "standard-v1"
    cpu = 2
    ram = 2
    disk = 5
    cf = 5
    },
    {
    name = "replica"
    platform_id = "standard-v1"
    cpu = 2
    ram = 1
    disk = 10
    cf = 5
    }
  ]
}

variable "vms_resources" {
  type        = map
  default     = {
    "web"    = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    "db" = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
variable "public_key" {
  type    = string
  default = ""
}
