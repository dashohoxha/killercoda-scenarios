# Text processing

Some of the commands that are used for text processing we have also
seen before, like `cat`, `sort`, `uniq`, `sed`, etc. We are going to
see some others too, like `cut`, `paste`, `join`, `tr`, etc,

1. Let's try and compare these commands:

   `du -s /usr/share/* | head`{{execute}}

   `du -s /usr/share/* | sort | head`{{execute}}

   `du -s /usr/share/* | sort -r | head`{{execute}}

   `du -s /usr/share/* | sort -nr | head`{{execute}}

   The command `du` gets the size (disk usage) of the files and
   directories of `/usr/share`, and `head` filters the top 10 results.
   
   Then we try to sort them with `sort` and `sort -r` (reverse), but
   it does not seem to work as expected (sorting results by the size).
   This is because `sort` by default sorts the first column
   alphabetically, so `2` is bigger than `10` (because `2 > 1`).
   
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
   sorting. By the way, most of the commands separate the fields of
   output by a TAB.
   
3. Let's create an example file that we will use for testing some more
   commands:
   
   ```
   cat <<END > distros.txt
   SUSE	10.2	12/07/2006
   Fedora	10	11/25/2008
   SUSE	11.0	06/19/2008
   Ubuntu	8.04	04/24/2008
   Fedora	8	11/08/2007
   SUSE	10.3	10/04/2007
   Ubuntu	6.10	10/26/2006
   Fedora	7	05/31/2007
   Ubuntu	7.10	10/18/2007
   Ubuntu	7.04	04/19/2007
   SUSE	10.1	05/11/2006
   Fedora	6	10/24/2006
   Fedora	9	05/13/2008
   Ubuntu	6.06	06/01/2006
   Ubuntu	8.10	10/30/2008
   Fedora	5	03/20/2006
   END
   ```{{execute}}

   By the way, this is like a history of some Linux distributions
   (their versions and release dates).
   
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
   
   Notice that if we don't use a range of field (like `1,1`, which
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
   
7. The option `-A` of the command `cat` makes its show any special
   characters, for example:

   `cat -A distros.txt`{{execute}}
   
   The tab character is represented by `^I`, and the `$` at the end
   shows the end of line.
   
8. The command `cut` extracts a certain column (field) from the input,
   for example:
   
   `cut -f 3 distros.txt`{{execute}}
   
   `cut -f 1,3 distros.txt`{{execute}}
   
   `cut -f 1-2,3 distros.txt`{{execute}}
   
   If we want to extract only the year, we can do it like this:
   
   `cut -f 3 distros.txt | cut -c 7-10`{{execute}}
   
   The option `-c` tell `cut` to extract from the line characters,
   instead of fields (as if each character is a field).

   `cut -f 3 distros.txt | cut -c 7-10,1-2,4-5`{{execute}}
   
   Another way to get the year would be like this:
   
   `expand distros.txt | cut -c 23-`{{execute}}
   
   The command `expand` replaces tabs by the corresponding number of
   spaces, so that the year would always start on position 23.

   When working with fields, it is possible to specify a different
   field delimiter, instead of the tab. For example:
   
   `cut -d ':' -f 1 /etc/passwd | head`{{execute}}
   
   Here we extract the first field from `/etc/passwd`.
