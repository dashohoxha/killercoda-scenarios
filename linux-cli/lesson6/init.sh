#!/bin/bash

# set prompt
cat <<EOF >> ~/.bashrc

PS1='\[\033[01;34m\]\w\[\033[00m\]$ \[\033[01;32m\]'
trap 'echo -ne "\033[00m"' DEBUG

EOF
source ~/.bashrc

# wait until locate is installed
clear
until hash locate &>/dev/null; do sleep 1; done

# clear screen
clear
:

