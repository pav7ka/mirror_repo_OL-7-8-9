#!/bin/bash

#export http_proxy="http://IP_OR_NAME:3128"
#export https_proxy="http://IP_OR_NAME:3128"

P_SCRIPT="/root/mirror/tools"
P_LIST="/root/mirror/list"
P_REPO="/usr/share/nginx/html/repos"
P_LOG="/root/mirror/log"

NEW="--newest-only"
NO_NEW=""

SRC=""
NO_SRC="--exclude="*.src""

DAYS="10"

function upd() {
    $P_SCRIPT/update_repo.sh "$P_LIST/$1/$2.repo" "$P_REPO/$1/$2" "$3" "$4" &> "$P_LOG/$2__$(date +%Y-%m-%d-%k%M%S)"
}

function upd_ver() {
    $P_SCRIPT/update_repo_ver.sh "$P_LIST/$1/$2.repo" "$P_REPO/$1/$2" "$3" "$4" "$5" &> "$P_LOG/$2-ol$5__$(date +%Y-%m-%d-%k%M%S)"
}


function delog() {
    $P_SCRIPT/del_log_file.sh "$1" "$2" &> "$P_LOG/__delog__$(date +%Y-%m-%d-%k%M%S)"
}

function pgdg_r() {
    $P_SCRIPT/pgdg_repo_redo.sh "$1"
}

function pgdg_u() {
    $P_SCRIPT/pgdg_repo_undo.sh "$1"
}


### OL9
upd "OL9" "epel-cisco-openh264" "$NO_NEW" "$NO_SRC"
upd "OL9" "epel" "$NO_NEW" "$NO_SRC"
###upd "OL9" "epel-testing" "$NO_NEW" "$NO_SRC"
upd "OL9" "oracle-epel-ol9" "$NO_NEW" "$NO_SRC"
upd "OL9" "oracle-linux-ol9" "$NO_NEW" "$NO_SRC"
upd "OL9" "uek-ol9" "$NO_NEW" "$NO_SRC"
upd "OL9" "virt-ol9" "$NO_NEW" "$NO_SRC"

## external
upd "OL9" "docker-ce" "$NO_NEW" "$NO_SRC"
upd "OL9" "nginx" "$NO_NEW" "$NO_SRC"
upd "OL9" "ocsinventory" "$NO_NEW" "$NO_SRC"
upd "OL9" "zabbix" "$NO_NEW" "$NO_SRC"
upd "OL9" "zfs" "$NO_NEW" "$SRC"

pgdg_r "9"
upd "OL9" "pgdg-redhat-all" "$NO_NEW" "$NO_SRC"
pgdg_u "9"


### OL8
upd "OL8" "mysql-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-epel-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-gluster-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-instantclient-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oraclelinux-automation-manager-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oraclelinux-developer-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-linux-manager-client-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-linux-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-olcne-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-ovirt-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-software-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "oracle-spacewalk-client-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "uek-ol8-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL8" "virt-ol8-x86_64" "$NO_NEW" "$NO_SRC"

## external
upd_ver "OL8" "docker-ce" "$NO_NEW" "$NO_SRC" "8"
upd_ver "OL8" "nginx" "$NO_NEW" "$NO_SRC" "8"
upd_ver "OL8" "ocsinventory" "$NO_NEW" "$NO_SRC" "8"
upd_ver "OL8" "zabbix" "$NO_NEW" "$NO_SRC" "8"
upd_ver "OL8" "zfs" "$NO_NEW" "$SRC" "8"

pgdg_r "8"
upd_ver "OL8" "pgdg-redhat-all" "$NO_NEW" "$NO_SRC" "8"
pgdg_u "8"


### OL7
upd "OL7" "mysql-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-ceph-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-epel-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-gluster-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-golang-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-graalvm-ce-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-instantclient-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oraclelinux-developer-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-linux-manager-client-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-linux-manager-server-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-linux-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-nodejs-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-olcne-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-ovirt-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-php-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-softwarecollection-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-software-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-spacewalk-client-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "oracle-spacewalk-server-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "uek-ol7-x86_64" "$NO_NEW" "$NO_SRC"
upd "OL7" "virt-ol7-x86_64" "$NO_NEW" "$NO_SRC"

## external
upd_ver "OL7" "docker-ce" "$NO_NEW" "$NO_SRC" "7"
upd_ver "OL7" "nginx" "$NO_NEW" "$NO_SRC" "7"
upd_ver "OL7" "ocsinventory" "$NO_NEW" "$NO_SRC" "7"
upd_ver "OL7" "zabbix" "$NO_NEW" "$NO_SRC" "7"
upd_ver "OL7" "zfs" "$NO_NEW" "$SRC" "7"

pgdg_r "7"
upd_ver "OL7" "pgdg-redhat-all" "$NO_NEW" "$NO_SRC" "7"
pgdg_u "7"

## CO7

upd "CO7" "centos7-extras" "$NO_NEW" "$NO_SRC"

### clean log file
delog "$P_LOG" "$DAYS"
