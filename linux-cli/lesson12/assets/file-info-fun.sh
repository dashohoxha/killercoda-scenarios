#!/bin/bash

file_info () {
    if [[ -e "$1" ]]; then
        echo -e "\nFile Type:"
        file "$1"
        echo -e "\nFile Status:"
        stat "$1"
    else
        local PROGNAME="$(basename "$0")"
        echo "$PROGNAME: usage: $FUNCNAME file" >&2
        return 1
    fi
}

echo -e '\nCalling file_info without args: file_info'
file_info

FILE=$0
echo -e '\nCalling file_info with an argument: file_info $FILE'
file_info $FILE

