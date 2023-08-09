locals {
namevm_web = "netology-develop-platform-web"
namevm_db  = "netology-develop-platform-db"
metadata = {
    ssh-key    = "${var.vms_ssh_user}:${file("~/.ssh/id_rsa.pub")}"
    }
}