#!/bin/bash

# create two user accounts
useradd -m -s /bin/bash first-user
useradd -m -s /bin/bash second-user

# set the prompt of each user
cat <<EOF >> /home/first-user/.bashrc
PS1='\[\033[01;31m\]first-user\[\033[00m\]@\[\033[01;33m\]localhost-1\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF
cat <<EOF >> /home/second-user/.bashrc
PS1='\[\033[01;31m\]second-user\[\033[00m\]@\[\033[01;33m\]localhost-2\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# install needed packages
apt install --yes sshpass
