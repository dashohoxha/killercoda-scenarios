#!/bin/bash

# Script to retrive a file via FTP

FTP_SERVER=ftp.nl.debian.org
FTP_PATH=/debian/dists/Debian11.2/main/installer-amd64/current/images/cdrom/
REMOTE_FILE=debian-cd_info.tar.gz

ftp -n << _EOF_
open $FTP_SERVER
user anonymous me@linuxbox
pass
cd $FTP_PATH
get $REMOTE_FILE
bye
_EOF_
ls -l $REMOTE_FILE
