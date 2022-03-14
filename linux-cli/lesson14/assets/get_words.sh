#!/bin/bash
# Return a list of the 100 most frequently used words inside a given page.

PAGE=$1

if [[ -z $PAGE ]]; then
    echo "Usage: $0 <html-page>" >&2
    exit 1
fi

wget -q -O- "$PAGE" \
    | tr "\n" ' ' \
    | sed -e 's/<[^>]*>/ /g' \
    | sed -e 's/&[^;]*;/ /g' \
    | tr -cs A-Za-z\' '\n' \
    | tr A-Z a-z \
    | sort \
    | uniq -c \
    | sort -k1,1nr -k2 \
    | sed 100q \
    | sed -E 's/^ +//' \
    | cut -d' ' -f2
