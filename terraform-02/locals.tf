locals {
namevm_web = "netology-develop-platform-web"
namevm_db  = "netology-develop-platform-db"
metadata = {
    serial-port-enable = "1"
    ssh-key    = var.vms_ssh_root_key
    }
}