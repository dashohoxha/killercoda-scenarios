#!/bin/bash

# stop the program after running for this many seconds
RUNTIME=10

check() {
    # check dependencies
    hash lynx || { echo "Please install lynx" >&2; exit 1; }
    hash w3m || { echo "Please install w3m" >&2; exit 1; }

    # check that there is an argument
    [[ -z $1 ]] && { echo "Usage: $0 <url>" >&2; exit 1; }
}

start_timer() {
    {
        sleep $RUNTIME
        echo "...Timeout..."
        local nr_words=$(cat tmp/words.txt | wc -l)
        echo "The number of collected words: $nr_words"
        kill -9 $$ >/dev/null 2>&1
    } &
}

get_urls() {
    lynx "$1" -listonly -nonumbers -dump 2>/dev/null \
        | grep -E '^https?://' \
	| sed -e 's/#.*$//'
}

get_words() {
    w3m -dump "$1" \
        | sed -e "s/[^[:alnum:]' -]\+//g" \
        | tr -cs A-Za-z\' '\n' \
        | tr A-Z a-z \
        | sort -u
}

get_words_1() {
    wget -q -O- "$1" \
        | tr "\n" ' ' \
        | sed -e 's/<[^>]*>/ /g' \
        | sed -e 's/&[^;]*;/ /g' \
        | tr -cs A-Za-z\' '\n' \
        | tr A-Z a-z \
        | sort -u
}

main() {
    check "$@"
    start_timer

    mkdir -p tmp/
    rm -f tmp/{todo,done}.txt
    touch tmp/{todo,done,words}.txt

    echo "$1" > tmp/todo.txt
    local url
    while true; do
        # pop the top url from todo.txt
        url=$(head -1 tmp/todo.txt)
        sed -i tmp/todo.txt -e 1d
    
        # check whether we have processed already this url
        grep -qF "$url" tmp/done.txt && continue
	echo "$url"
    
        # extract the links from it and append them to todo.txt
        get_urls "$url" >> tmp/todo.txt
    
        # extract all the words from this url
        get_words "$url" >> tmp/words.txt
        sort -u tmp/words.txt > tmp/words1.txt
        mv tmp/words1.txt tmp/words.txt
    
        # mark this url as processed
        echo "$url" >> tmp/done.txt
    done
}

# call the main function
main "$@"
