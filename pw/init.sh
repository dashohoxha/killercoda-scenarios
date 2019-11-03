#!/bin/bash

# set prompt
cat <<EOF >> ~/.bashrc

PS1='\[\033[01;34m\]\w\[\033[00m\]$ \[\033[01;32m\]'
trap 'echo -ne "\033[00m"' DEBUG

EOF
source ~/.bashrc

# wait until highlight is installed
: Please wait
until hash highlight &>/dev/null; do sleep 1; done

# alias for highlight
alias hl='highlight -O xterm256'

# clear screen
clear
:
: Simple CLI Password Manager
:
