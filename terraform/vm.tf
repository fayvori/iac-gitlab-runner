resource "yandex_compute_instance" "default" {
  name               = "gitlab-runner-${uuid()}"
  service_account_id = yandex_iam_service_account.gitlab-sa.id
  description        = "Instance for self-hosted gitlab-runner"
  zone               = var.zone

  resources {
    cores  = 2
    memory = 4
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.gitlab-runner-vpc-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  boot_disk {
    initialize_params {
      image_id    = var.image-id
      size        = 30
      description = "Ubuntu 22:04 boot os"
    }
  }
}

data "yandex_compute_instance" "gitlab-runner-vm" {
  instance_id = yandex_compute_instance.default.id
}

output "gitlab-runner-vm-external-ip" {
  value = data.yandex_compute_instance.gitlab-runner-vm.network_interface.0.nat_ip_address
}
