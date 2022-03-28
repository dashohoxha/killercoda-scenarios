#!/bin/bash

N=$1
if [[ -z $N ]]; then
    echo "Usage: $0 <n>" >&2
    exit 1
fi

[[ $N == 0 ]] && echo 0 && exit
[[ $N == 1 ]] && echo 1 && exit

f0=0
f1=1
for ((i=1; i<N; i++)); do
    fib=$((f0 + f1))
    f0=$f1
    f1=$fib
done
echo $f1
