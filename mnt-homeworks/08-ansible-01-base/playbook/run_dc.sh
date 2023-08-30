#!/bin/bash
docker run -it -d --name centos mnt-hw-01-centos:1.0 bash
docker run -it -d --name ubuntu mnt-hw-01-ubuntu:1.0 bash
docker run -it -d --name fedora pycontribs/fedora bash
docker ps
ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass