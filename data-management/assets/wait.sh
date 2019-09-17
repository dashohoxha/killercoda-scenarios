#!/bin/bash

wait() {
    local file=$1
    local msg=${2:-Wait}
    echo "$msg..."
    until test -f $file ; do
        for c in '/' '-' '\' '|' ; do
            echo -ne "\r[$c]"
            sleep .5
        done
    done
    echo -e "\rDone"
}

wait /var/.dvc-installed "Installing DVC"
