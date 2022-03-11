#!/bin/bash

# array-sort: Sort an array

a=(f e d c b a)

echo "Original array: ${a[@]}"
a_sorted=($(for i in "${a[@]}"; do echo $i; done | sort))
#a_sorted=($(echo "${a[@]}" | tr ' ' "\n" | sort))
echo "Sorted array:   ${a_sorted[@]}"
