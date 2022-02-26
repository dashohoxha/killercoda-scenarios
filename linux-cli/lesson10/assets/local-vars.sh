#!/bin/bash

# Script to demonstrate local variables

foo=0    # global variable foo

funct_1 () {
    local foo    # variable foo local to func_1

    foo=1
    echo "funct_1: foo = $foo"
}

funct_2 () {
    local foo    # variable foo local to func_2

    foo=2
    echo "funct_2: foo = $foo"
}


echo "global:  foo = $foo"
funct_1
echo "global:  foo = $foo"
funct_2
echo "global:  foo = $foo"
