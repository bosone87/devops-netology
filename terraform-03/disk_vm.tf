resource "yandex_compute_disk" "empty-disk" {
  count    = 3
  name     = "disk-${count.index}"
  type     = "network-hdd"
  size     = 1
} 

resource "yandex_compute_instance" "storage" {
  depends_on = [yandex_compute_disk.empty-disk]
  name        = "storage"
  platform_id = var.vms_web_platform

  dynamic "secondary_disk" {
        for_each = yandex_compute_disk.empty-disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
      
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