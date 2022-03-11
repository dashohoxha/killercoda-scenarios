#!/bin/bash

# pro-sub: demo of process substitution

while read attr links owner group size d1 d2 d3 filename; do
    cat <<- EOF
	Filename:   $filename
	Size:       $size
	Owner:      $owner
	Group:      $group
	Modified:   $d1 $d2 $d3
	Links:      $links
	Attributes: $attr
	
	EOF
done < <(ls -lh $1 | tail -n +2)
