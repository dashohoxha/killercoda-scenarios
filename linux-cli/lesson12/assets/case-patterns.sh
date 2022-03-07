#!/bin/bash

read -p "enter word > "

case "$REPLY" in
    [[:alpha:]])  echo "it is a single alphabetic character" ;;
    [ABC][0-9])   echo "it is A, B, or C followed by a digit" ;;
    ???)          echo "it is three characters long" ;;
    *.txt)        echo "it is a word ending in '.txt'" ;;
    *)            echo "it is something else" ;;
esac
