#!/bin/bash

# set prompt
cat <<EOF >> ~/.bashrc
PS1='\[\033[01;31m\]root\[\033[00m\]@\[\033[01;33m\]central-server\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF
source ~/.bashrc

# clear screen
clear
