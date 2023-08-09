output "vms" {

value = concat([
    {
    name = "${yandex_compute_instance.web.*.name}"
    id   = "${yandex_compute_instance.web.*.id}"
    fqdn = "${yandex_compute_instance.web.*.fqdn}"
    },
    {
    name = [for k,v in "${yandex_compute_instance.vm}": v.name]
    id   = [for k,v in "${yandex_compute_instance.vm}": v.id]
    fqdn = [for k,v in "${yandex_compute_instance.vm}": v.fqdn]
    },
    {
    name = "${yandex_compute_instance.storage.*.name}"
    id   = "${yandex_compute_instance.storage.*.id}"
    fqdn = "${yandex_compute_instance.storage.*.fqdn}"
    }
])
}