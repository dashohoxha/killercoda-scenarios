#!/bin/bash
# read-ifs: read fields from a file

read -p "Enter a username > " user_name

file_info="$(grep "^$user_name:" /etc/passwd)"

if [ -z "$file_info" ]; then
    echo "No such user '$user_name'" >&2
    exit 1
fi

IFS=":" read user pw uid gid name home shell <<< "$file_info"

echo "User      = '$user'"
echo "UID       = '$uid'"
echo "GID       = '$gid'"
echo "Full Name = '$name'"
echo "Home Dir  = '$home'"
echo "Shell     = '$shell'"
