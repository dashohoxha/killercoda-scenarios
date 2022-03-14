# Examples

1. This is a simple script that gets as argument the URL of a web page
   and returns all the URLs inside that page:

   `vim get_urls.sh`{{execute}}
   
   `./get_urls.sh`{{execute}}
   
   `url=http://linuxcommand.org/`{{execute}}
   
   `./get_urls.sh $url`{{execute}}
   
   Let's see how it works:
   
   `wget -qO- $url`{{execute}}
   
   `wget -qO- $url | grep -Eoi '<a [^>]+>'`{{execute}}
   
   The option `-E` is for extended regexp syntax, `-o` is for
   displaying only the matching part, and `-i` is for case
   insensitive. We are extracting all the _anchor_ tags.
   
   `wget -qO- $url | grep -Eoi '<a [^>]+>' | grep -Eo 'href="?([^\"]+)"?'`{{execute}}
   
   Extracting the attribute `href`.
   
   ```
   wget -qO- $url \
       | grep -Eoi '<a [^>]+>' \
       | grep -Eoi 'href="?([^\"]+)"?' \
       | grep -v 'mailto:' \
       | sed -e 's/"//g' -e 's/href=//'
   ```{{execute}}
   
2. This is a simple script that gets as argument the URL of a web page
   and returns a list of the 100 most frequently used words inside it:
   
   `vim get_words.sh`{{execute}}
   
   `./get_words.sh`{{execute}}
   
   `url=https://en.wikipedia.org/wiki/Linux`{{execute}}
   
   `/get_words.sh $url`{{execute}}

   `/get_words.sh $url | less`{{execute}}

   `/get_words.sh $url | wc -l`{{execute}}

   ```
   wget -q -O- "$PAGE" \
      | tr "\n" ' ' \
      | sed -e 's/<[^>]*>/ /g' \
      | sed -e 's/&[^;]*;/ /g' \
      | tr -cs A-Za-z\' '\n' \
      | tr A-Z a-z \
      | less
   ```{{execute}}

   ```
   wget -q -O- "$PAGE" \
      | tr "\n" ' ' \
      | sed -e 's/<[^>]*>/ /g' \
      | sed -e 's/&[^;]*;/ /g' \
      | tr -cs A-Za-z\' '\n' \
      | tr A-Z a-z \
      | sort \
      | uniq -c \
      | less
   ```{{execute}}

   ```
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
      | less
   ```{{execute}}

3. This is a script that calculates the Fibonacci numbers, using an
   iterative algorithm:
   
   `vim fibo.sh`{{execute}}
   
   `./fibo.sh`{{execute}}
   
   `for i in {0..10}; do ./fibo.sh $i; done`{{execute}}
   
   `./fibo.sh 100`{{execute}}

4. This is a script that solves the problem of Towers of Hanoi, using
   a recursive algorithm:

   `vim hanoi.sh`{{execute}}
   
   `./hanoi.sh <<< 0`{{execute}}

   `./hanoi.sh <<< 1`{{execute}}

   `./hanoi.sh <<< 2`{{execute}}

   `./hanoi.sh <<< 3`{{execute}}

   `./hanoi.sh <<< 4`{{execute}}

   `./hanoi.sh <<< 5`{{execute}}
