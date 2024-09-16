#!/bin/bash

sudo apt-get update
sudo apt-get install make -y
curl -fsSL https://get.docker.com | sh -

mkdir -p /home/amine/data/

if ! sudo lsblk -f /dev/disk/by-id/google-cloud-1-disk | grep -q ext4 ; then
    sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/google-cloud-1-disk
fi

sudo mount -o discard,defaults /dev/disk/by-id/google-cloud-1-disk /home/amine/data

mkdir -p /home/amine/data/mariadb
mkdir -p /home/amine/data/wp

cd /home/amine/srcs || exit 1

echo "
DOMAINNAME=https://$(curl -s ifconfig.me)
HOSTNAME=$(curl -s ifconfig.me)
" >> .env

sudo docker compose up -d