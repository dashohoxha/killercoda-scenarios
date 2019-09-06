#!/bin/bash

#wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list
#apt update
#apt install --yes dvc

pip install dvc

dvc version

#echo "done" >> /var/.dvc-installed
