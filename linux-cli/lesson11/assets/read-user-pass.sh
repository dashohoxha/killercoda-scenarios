#!/bin/bash

# -e: use readline to get the input
# -p: display a prompt
# -i: provide a default reply
read -e -p "What is your user name > " -i $USER username
echo "Welcome '$username'"

# -t: timeout (in seconds)
# -s: silent (do not echo characters to the display as they are typed)
# -p: display a prompt
if read -t 10 -sp "Enter your secret passphrase > " secret_pass
then
    echo -e "\nYour secret passphrase is '$secret_pass'"
else
    echo -e "\nInput timed out" >&2
    exit 1
fi
