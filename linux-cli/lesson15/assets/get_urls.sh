#!/bin/bash
# Get all the URLs inside a given HTML page.

PAGE=$1

if [[ -z $PAGE ]]; then
    echo "Usage: $0 <html-page>" >&2
    exit 1
fi

wget -qO- "$PAGE" \
    | grep -Eoi '<a [^>]+>' \
    | grep -Eo 'href="?([^\"]+)"?' \
    | grep -v 'mailto:' \
    | sed -e 's/"//g' -e 's/href=//'
