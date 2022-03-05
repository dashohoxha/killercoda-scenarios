#!/bin/bash

# read-integer: evaluate the value of an integer.

echo -n "Please enter an integer -> "
read int

if [[ ! "$int" =~ ^-?[0-9]+$ ]]; then
    echo "Input value is not an integer." >&2
    exit 1
fi

if ((int == 0)); then
    echo "$int is zero."
else
    if ((int < 0)); then
        echo "$int is negative."
    else
        echo "$int is positive."
    fi

    if (( ((int % 2)) == 0)); then
        echo "$int is even."
    else
        echo "$int is odd."
    fi
fi
