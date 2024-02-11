#!/bin/bash

export http_proxy="http://IP_OR_NAME:3128"
export https_proxy="http://IP_OR_NAME:3128"

P_REPO="/usr/share/nginx/html/repos"
P_LOG="/root/mirror/log"

for VER in 16 15 14 13 12 #11 10
do
    wget -c -np -nv --reject="index.html*" -e robots=off -m "https://repo.postgrespro.ru/1c-$VER/" -P "$P_REPO" &> "$P_LOG/postgrespro_1c-$VER"__"$(date +%Y-%m-%d-%k%M%S)"
done
