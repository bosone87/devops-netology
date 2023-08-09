resource "yandex_compute_instance" "web" {
  count = 2
  name        = "netology-develop-platform-web-${count.index == 0 ? 1 : 2}"
  platform_id = var.vms_web_platform

  resources {
    cores         = var.vms_web_resources.web.cores
    memory        = var.vms_web_resources.web.memory
    core_fraction = var.vms_web_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.metadata
}