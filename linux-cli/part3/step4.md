# More regex examples

1. Suppose that we are solving a crossword puzzle and we need a five
   letter word whose third letter is "j" and last letter is "r". Let's
   try to use `grep` and regex to solve this.
   
   Fist of all make sure that we have a dictionary of words installed:
   
   `apt install wbritish`{{execute}}
   
   `ls /usr/share/dict/`{{execute}}
   
   `less /usr/share/dict/words`{{execute}}
   
   `cat /usr/share/dict/words | wc -l`{{execute}}
   
   Now try this:
   
   `grep -i '^..j.r$' /usr/share/dict/words`{{execute}}
   
   The option `-i` is used to ignore the case (uppercase, lowercase).
   
   The regex pattern `'^..j.r$'` will match lines that contain exactly
   5 letters, where the third letter is `j` and the last one is `r`.

2. Let's say that we want to check a phone number for validity and we
   consider a phone number to be valid if it is in the form `(nnn)
   nnn-nnnn` or in the form `nnn nnn-nnnn` where `n` is a digit. We
   can do it like this:
   
   `echo "(555) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'`{{execute}}
   
   `echo "555 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'`{{execute}}
   
   `echo "AAA 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'`{{execute}}
   
   Since we are using the option `-E` (for extended), we have to
   escape the parentheses (`\(` and `\)`) so that they are not
   interpreted as metacharacters.
   
   If we use basic regular expression (without `-E`), then we don't
   need to escape the parentheses, but in this case we will have to
   escape the question marks (`\?`) so that they are interpreted as
   metacharacters:
   
   `echo "(555) 123-4567" | grep '^(\?[0-9][0-9][0-9])\? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'`{{execute}}

   The question mark as a metacharacter means that the parentheses
   before it can be zero or one time.

3. Using the metachars `{}` we can express the number of required
   matches. For example:
   
   `echo "(555) 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'`{{execute}}
   
   The expression `{3}` matches if the preceding element occurs
   exactly 3 times.
   
   We could also replace `?` by `{0,1}`, or `{,1}`:

   `echo "(555) 123-4567" | grep -E '^\({0,1}[0-9]{3}\){,1} [0-9]{3}-[0-9]{4}$'`{{execute}}
   
   `echo "555 123-4567" | grep -E '^\({0,1}[0-9]{3}\){,1} [0-9]{3}-[0-9]{4}$'`{{execute}}
   
   In general, `{n,m}` matches if the preceding element occurs at
   least `n` times, but no more than `m` times. These are also valid:
   `{n,}` (at least `n` times), and `{,m}` (at most `m` times).

4. Similar to `?` which is equivalent to `{0,1}`, there is also `*`
   which is equivalent to `{0,}` (zero or more occurrences), and `+`
   which is equivalent to `{1,}` (one or more, at least one
   occurrence):
   
   Let's say that we want to check is a string is a sentence. This
   means that it starts with an uppercase letter, then contains any
   number of upper and lowercase letters and spaces, and finally ends
   with a period. We could do it like this:
   
   `echo "This works." | grep -E '[A-Z][A-Za-z ]*\.'`{{execute}}
   
   `echo "This Works." | grep -E '[A-Z][A-Za-z ]*\.'`{{execute}}
   
   `echo "this does not" | grep -E '[A-Z][A-Za-z ]*\.'`{{execute}}
   
   Or like this:
   
   `echo "This works." | grep -E '[[:upper:]][[:upper:][:lower:] ]*\.'`{{execute}}
   
   Note: In all these cases we have to escape the period (`\.`) so that
   it matches itself instead of any character.
   
5. Here is a regular expression that will only match lines consisting
   of groups of one or more alphabetic characters separated by single
   spaces:
   
   `echo "This that" | grep -E '^([[:alpha:]]+ ?)+$'`{{execute}}
   
   `echo "a b c" | grep -E '^([[:alpha:]]+ ?)+$'`{{execute}}
   
   `echo "a b  c" | grep -E '^([[:alpha:]]+ ?)+$'`{{execute}}
   
   Does not match because there are two consecutive spaces.
   
   `echo "a b 9" | grep -E '^([[:alpha:]]+ ?)+$'`{{execute}}
   
   Does not match because there is a non-alphabetic character.
   
6. Let's create a list of random phone numbers for testings:

   `echo $RANDOM`{{execute}}
   
   `echo $RANDOM`{{execute}}
   
   `echo ${RANDOM:0:3}`{{execute}}
   
   `for i in {1..10}; do echo "${RANDOM:0:3} ${RANDOM:0:3}-${RANDOM:0:4}" >> phonelist.txt; done`{{execute}}

   `cat phonelist.txt`{{execute}}
   
   `for i in {1..100}; do echo "${RANDOM:0:3} ${RANDOM:0:3}-${RANDOM:0:4}" >> phonelist.txt; done`{{execute}}

   `less phonelist.txt`{{execute}}
   
   `cat phonelist.txt | wc -l`{{execute}}
   
   You can see that some of the phone numbers are malformed.
   We can display those that are malformed like this:
   
   `grep -Ev '^[0-9]{3} [0-9]{3}-[0-9]{4}$' phonelist.txt`{{execute}}
   
   The option `-v` makes an inverse match, which means that `grep`
   displays only the lines that do not match the given pattern.

7. Regular expressions can be used with many commands, not just with
   `grep`.
   
   For example let's use them with `find` to find the files that
   contain bad characters in their name (like spaces, punctuation
   marks, etc):
   
   `touch "bad file name!"`{{execute}}
   
   `ls -l`{{execute}}
   
   `find . -regex '.*[^-_./0-9a-zA-Z].*'`{{execute}}
   
   Different from `grep`, `find` expects the pattern to match the
   whole filename, that's why we are appending and prepending `.*` to
   the pattern.

   We can use regular expressions with `locate` like this:
   
   `locate --regex 'bin/(bz|gz|zip)'`{{execute}}

   We can also use them with `less`:
   
   `less phonelist.txt`{{execute}}
   
   We can press `/` and write a regular expression, and `less` will
   find and highlight the matching lines. For example:
   
   `/^[0-9]{3} [0-9]{3}-[0-9]{4}$`{{execute}}
   
   The invalid lines will not be highlighted and will be easy to spot.
   
   Regular expressions can also be used with `zgrep` like this:

   `cd /usr/share/man/man1`{{execute}}
   
   `zgrep -El 'regex|regular expression' *.gz`{{execute}}
   
   It will find man pages that contain either "regex" or "regular
   expression". As we can see, regular expressions show up in a lot of
   programs.
