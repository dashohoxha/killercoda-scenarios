# Regular expressions

Regular expressions are symbolic notations used to identify patterns
in text. They are supported by many command line tools and by most of
programming languages to facilitate the solution of text manipulation
problems.

1. We will test regular expressions with `grep` (which means "global
   regular expression print"). It searches text files for the
   occurrence text matching a specified regular expression and
   outputs any line containing a match to standard output.
   
   `ls /usr/bin | grep zip`{{execute}}
   
   In order to explore `grep`, let's create some text files to search:
   
   `ls /bin > dirlist-bin.txt`{{execute}}
   
   `ls /usr/bin > dirlist-usr-bin.txt`{{execute}}
   
   `ls /sbin > dirlist-sbin.txt`{{execute}}
   
   `ls /usr/sbin > dirlist-usr-sbin.txt`{{execute}}
   
   `ls dirlist*.txt`{{execute}}
   
   We can do a simple search on these files like this:
   
   `grep bzip dirlist*.txt`{{execute}}
   
   If we are interested only in the list of files that contain
   matches, we can use the option `-l`:

   `grep -l bzip dirlist*.txt`{{execute}}
   
   Conversely, if we want to see a list of files that do not
   contain a match, we can use `-L`:

   `grep -L bzip dirlist*.txt`{{execute}}
   
2. While it may not seem apparent, we have been using regular
   expressions in the searches we did so far, albeit very simple ones.
   The regular expression "bzip" means that a line will match if it
   contains the letters "b", "z", "i", "p" in this order and without
   other characters in between.
   
   Besides the _literal characters_, which represent themselves, we
   can also use _metacharacters_ in a pattern. For example a _dot_ (`.`)
   matches any character:
   
   `grep -h '.zip' dirlist*.txt`{{execute}}
   
   The option `-h` suppresses the output of filenames.
   
   Notice that the `zip` program was not found because it has only 3
   letters and does not match the pattern.
   
3. The caret (`^`) and dollar sign (`$`) are treated as _anchors_ in
   regular expressions. This means that they cause the match to occur
   only if the regular expression is found at the beginning of the
   line (`^`) or at the end of the line (`$`):
   
   `grep -h '^zip' dirlist*.txt`{{execute}}
   
   `grep -h 'zip$' dirlist*.txt`{{execute}}
   
   `grep -h '^zip$' dirlist*.txt`{{execute}}
   
   Note that the regular expression '`^$`' will match empty lines.
   
4. Using _bracket expressions_ we can match a single character from a
   specified set of characters:
   
   `grep -h '[bg]zip' dirlist*.txt`{{execute}}
   
   If the first character in a bracket expression is a caret (`^`),
   than any character will be matched, except for those listed:
   
   `grep -h '[^bg]zip' dirlist*.txt`{{execute}}
   
   The caret character only invokes negation if it is the first
   character within the bracket expression; otherwise it loses its
   special meaning and becomes an ordinary character in the set:
   
   `grep -h '[b^g]zip' dirlist*.txt`{{execute}}
   
5. If we want to find all lines that start with an uppercase letter,
   we can do it like this:
   
   `grep -h '^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]' dirlist*.txt`{{execute}}
   
   We can do less typing if we use a range:
   
   `grep -h '^[A-Z]' dirlists*.txt`{{execute}}
   
   If we want to match any alphanumeric character (all the letters and
   digits), we can use several ranges, like this:
   
   `grep -h '^[A-Za-z0-9]' dirlists*.txt`{{execute}}
   
   However the dash (`-`) character in this example stands for itself,
   does not make a range:

   `grep -h '^[-AZ]' dirlists*.txt`{{execute}}
   
   Besides ranges, another way to match groups of characters is using
   POSIX character classes:
   
   `grep -h '^[[:alnum:]]' dirlists*.txt`{{execute}}
   
   `ls /usr/sbin/[[:upper:]]*`{{execute}}
   
   Other character classes are: `[:alpha:]`, `[:lower:]`, `[:digit:]`,
   `[:space:]`, `[:punct:]` (for punctuation characters), etc.

6. With a vertical bar (`|`) we can define alternative matching
   patterns:
   
   `echo "AAA" | grep AAA`{{execute}}
   
   `echo "BBB" | grep BBB`{{execute}}
   
   `echo "AAA" | grep 'AAA\|BBB'`{{execute}}
   
   `echo "BBB" | grep -E 'AAA|BBB'`{{execute}}

   `echo "CCC" | grep -E 'AAA|BBB'`{{execute}}

   `echo "CCC" | grep -E 'AAA|BBB|CCC'`{{execute}}

   The option `-E` tells `grep` to use _extended_ regular expressions.
   With extended regular expressions the vertical bar (`|`) is a
   metacharacter (used for alternation) and we need to escape it (with
   `\`) to use it as a literal character. With _basic_ regular
   expressions (without the option `-E`) the vertical bar is a
   literal character and we need to escape it (with `\`) if we want
   to use it as a metacharacter.
   
7. Other metacharacters that are recognized by extended regular
   expressions, and which behave similar to `|` are: `(`, `)`, `{`,
   `}`, `?`, `+`. For example:
   
   `grep -Eh '^(bz|gz|zip)' dirlist*.txt`{{execute}}
   
   Note that this is different from:
   
   `grep -Eh '^bz|gz|zip' dirlist*.txt`{{execute}}
   
   In the first example all the patterns are matched at the beginning
   of the line. In the second one only `bz` is matched at the
   beginning.
