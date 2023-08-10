terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.96.1"
    }
  }
}

variable "cloud-id" {
  type        = string
  description = "You can get cloud-id using cli by running `yc resource-manager folder get --name YOUR_FOLDER_NAME`"
  nullable    = false
}

variable "folder-id" {
  type        = string
  description = "You can get folder-id using cli by running `yc resource-manager folder get --name YOUR_FOLDER_NAME`"
  nullable    = false
}

variable "token" {
  type        = string
  description = "You can generate yc token using yandex cli by running `yc iam create-token`"
  nullable    = false
}

variable "zone" {
  type        = string
  description = "yandex zone where all the resources will create"
  default     = "ru-central1-a"
}

// Ubuntu 20:04 image-id
variable "image-id" {
  type        = string
  description = "yandex compute instance image id which will be using to determite which type of operating system compute instance will use"
  default     = "fd8bkgba66kkf9eenpkb"
}

provider "yandex" {
  cloud_id  = var.cloud-id
  folder_id = var.folder-id
  token     = var.token
  zone      = var.zone
}
