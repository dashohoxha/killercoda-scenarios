#!/bin/bash

# modulo: demonstrate the modulo operator

for ((i = 0; i <= 20; ++i)); do
    if ((i % 5 == 0)); then
        printf "<%d> " "$i"
    else
        printf "%d " "$i"
    fi
done
printf "\n"
