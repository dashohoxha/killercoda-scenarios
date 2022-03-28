#!/bin/bash

solve_hanoi() {
    local disks=$1 src=$2 dst=$3 aux=$4
    if ((disks > 0)); then
        solve_hanoi $((disks - 1)) $src $aux $dst
        echo "move $src --> $dst"
        ((nr_moves++))
        solve_hanoi $((disks - 1)) $aux $dst $src
    fi
}

read -p "Towers of Hanoi. How many disks? " disks

nr_moves=0     # start with no moves
solve_hanoi $disks 'src' 'dst' 'aux'

echo "It took $nr_moves moves to solve Towers for $disks disks."
