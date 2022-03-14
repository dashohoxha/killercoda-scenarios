# Examples

Write a bash script that collects web pages from the internet,
starting from a root page, extracts the words in each page, and
creates a list of words.

`vim crawler.sh`{{execute}}

The file `tmp/todo.txt` contains a list of URLs, one per line, that
are to be visited. Initially we add to it the root URL that is given
as an argument.

The file `tmp/done.txt` contains a list of URLs, one per line, that
are already visited. The file `tmp/words.txt` contains a list of words
that have been collected so far, one per line and sorted
alphabetically.

There is an infinite loop in which we do these steps:
1. Get the top URL from `tmp/todo.txt` (and delete it from the file).
2. If not valid (does not start with `http://` or `https://`),
   continue with the next URL.
3. If valid, extract all the URLs on this page and append them to
   `tmp/todo.txt`, in order to visit them later.
4. Get all the words from this page and merge them to `tmp/words.txt`.
5. Append this URL to `tmp/done.txt`, so that we don't process it again.

This infinite loop is never stopped, but there is a timer which stops
the program after running for a certain amount of seconds.

`./crawler.sh`{{execute}}

`apt install -y w3m`{{execute}}

`./crawler.sh`{{execute}}

`url=https://en.wikipedia.org/wiki/Linux`{{execute}}

`./crawler.sh $url`{{execute}}

`less tmp/words.txt`{{execute}}

Let's increase the `RUNTIME`:

`sed -i crawler.sh -e '/^RUNTIME=/ c RUNTIME=100'`{{execute}}

`rm -rf tmp/`{{execute}}

`./crawler.sh $url`{{execute}}

`cat tmp/words.txt | wc -l`{{execute}}

`less tmp/words.txt`{{execute}}

