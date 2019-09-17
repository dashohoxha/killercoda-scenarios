#!/bin/bash

rm -f /var/.dvc-installed

pip3 install dvc

touch /var/.dvc-installed
