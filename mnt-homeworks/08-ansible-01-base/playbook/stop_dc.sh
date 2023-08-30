#!/bin/bash
docker kill $(docker ps -q)
docker rm centos
docker rm ubuntu
docker rm fedora