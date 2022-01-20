# sort

1. Let's try and compare these commands:

   `du -s /usr/share/* | less`{{execute}}

   `du -s /usr/share/* | sort | less`{{execute}}

   `du -s /usr/share/* | sort -r | less`{{execute}}

   `du -s /usr/share/* | sort -nr | less`{{execute}}

   `du -s /usr/share/* | sort -nr | head`{{execute}}

   The command `du` gets the size (disk usage) of the files and
   directories of `/usr/share`, and `head` filters the top 10 results.
   
   Then we try to sort them with `sort` and `sort -r` (reverse), but
   it does not seem to work as expected (sorting results by the size).
   This is because `sort` by default sorts the first column
   alphabetically, so `2` is bigger than `10` (because `2` comes after
   `1` on the character set).
   
   With the option `-n` we tell sort to do a _numerical_ sort. So, the
   last command returns the top 10 biggest files and directories on
   `/usr/share`.
   
2. This example works because the numerical values happen to be on the
   first column of the output. What if we want to sort a list based on
   another column? For example the result of `ls -l`:
   
   `ls -l /usr/bin | head`{{execute}}
   
   Ignoring for the moment that `ls` can sort its results by size, we
   could use `sort` to sort them like this:
    
   `ls -l /usr/bin | sort -nr -k 5 | head`{{execute}}
   
   The option `-k5` tells `sort` to use the fifth field as the key for
   sorting. By the way, `ls` like most of the commands, separates the
   fields of its output by a TAB.
   
3. For testing we are going to use the file `distros.txt`, which is
   like a history of some Linux distributions (containing their
   versions and release dates).
   
   `cat distros.txt`{{execute}}

   `cat -A distros.txt`{{execute}}

   The option `-A` makes it show any special characters. The tab
   character is represented by `^I`, and the `$` shows the end of
   line.
   
4. Let's try to sort it:

   `sort distros.txt`{{execute}}
   
   The result is almost correct, but Fedora version numbers are not in
   the correct order (since `1` comes before `5` in the character set).
   
   To fix this we are going to sort on multiple keys. We want an
   alphabetic sort on the first field and a numeric sort on the second
   field:
   
   `sort --key=1,1 --key=2n distros.txt`{{execute}}
   
   `sort -k 1,1 -k 2n distros.txt`{{execute}}
   
   `sort -k1,1 -k2n distros.txt`{{execute}}
   
   Notice that if we don't use a range of fields (like `1,1`, which
   means start at field 1 and end at field 1), it is not going to work
   as expected:

   `sort -k 1 -k 2n distros.txt`{{execute}}
   
   This is because in this case it starts at field 1 and goes up to
   the end of the line, ignoring thus the second key.
   
   The modifier `n` stands for _numerical sort_. Other modifiers are
   `r` for _reverse_, `b` for _ignore blanks_, etc.

5. Suppose that we want to sort the list in reverse chronological
   order (by release date). We can do it like this:
   
   `sort -k 3.7nbr -k 3.1nbr -k 3.4nbr distros.txt`{{execute}}

   The `--key` option allows specification of offsets within fields.
   So `3.7` means start sorting from the 7-th character of the 3-rd
   field, which is the year. The modifier `n` makes it a numerical
   sort, `r` does reverse sorting, and with `b` we are suppressing any
   leading spaces of the third field.
   
   In a similar way, the second sort key `3.1` sorts by the month, and
   the third key `3.4` sorts by day.

6. Some files don't use tabs and spaces as delimiters, for example
   the file `/etc/passwd`:
   
   `head /etc/passwd`{{execute}}
   
   In this case we can use the option `-t` to define the field
   separator character. For example to sort `/etc/passwd` on the
   seventh field (the account's default shell), we could do this:
   
   `sort -t ':' -k 7 /etc/passwd | head`{{execute}}
