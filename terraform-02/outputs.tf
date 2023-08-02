output "vm_external_ip" {
value = tomap({
    web = "${yandex_compute_instance.platform.*.network_interface.0.nat_ip_address}"
    db  = "${yandex_compute_instance.platform-db.*.network_interface.0.nat_ip_address}"
})
description = "vms external ip"
}