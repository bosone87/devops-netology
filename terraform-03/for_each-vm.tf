resource "yandex_compute_instance" "vm" {
    depends_on = [ yandex_compute_instance.web ]
    for_each = {for key, value in var.vms_web_resources_4each: key => value}
    name = "netology-develop-platform-web-${each.value.name}"
    platform_id = each.value.platform_id
    
    resources {
        cores  = each.value.cpu
        memory = each.value.ram
        core_fraction = each.value.cf
    }

    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        size = each.value.disk
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
