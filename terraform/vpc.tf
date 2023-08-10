resource "yandex_vpc_network" "gitlab-runner-vpc" {
  name        = "gitlab-runner-vpc"
  description = "VPC for gitlab-runner vm instance"
}

resource "yandex_vpc_subnet" "gitlab-runner-vpc-subnet" {
  name           = "gitlab-runner-vpc-subnet"
  description    = "Subnet for gitlab-runner instance"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.gitlab-runner-vpc.id
}
