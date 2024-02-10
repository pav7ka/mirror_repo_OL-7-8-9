#!/bin/bash

P_YUM="/etc/yum.repos.d"
FILE="pgdg-redhat-all.repo"
EXT="bak$1"

if [[ -f $P_YUM/$FILE.$EXT ]]
then
  mv $P_YUM/$FILE.$EXT $P_YUM/$FILE
else
#  echo "file does not exist"
  exit 1
fi
