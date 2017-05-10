#!/bin/sh

yum update -y

#docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce
systemctl enable docker
systemctl start docker
docker pull python:3-alpine

#memory limitations : too much swap by default
swapdevice=/dev/mapper/VolGroup00-LogVol01
swapoff $swapdevice
lvresize -f -L 128M $swapdevice
mkswap $swapdevice
swapon $swapdevice
