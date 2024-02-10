#!/bin/bash

# /etc/pki/rpm-gpg

wget -O pgdg_7.rpm -c https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

wget -O pgdg_8.rpm -c https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

wget -O pgdg_9.rpm -c https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

wget -c https://download.docker.com/linux/centos/gpg

wget -c https://nginx.org/keys/nginx_signing.key

wget -c http://centos.org/keys/RPM-GPG-KEY-CentOS-7
