#!/bin/bash

for REPO in $(cat $1)
do
    yes | dnf reposync $3 $4 --releasever=$5 --repo=$REPO --delete --download-metadata -p $2
done