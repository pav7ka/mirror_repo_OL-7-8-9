#!/bin/bash

P_YUM="/etc/yum.repos.d"
FILE="pgdg-redhat-all.repo"
EXT="bak$1"

if [[ -f $P_YUM/$FILE ]]
then
  mv $P_YUM/$FILE $P_YUM/$FILE.$EXT
else
#  echo "file does not exist"
  exit 1
fi
