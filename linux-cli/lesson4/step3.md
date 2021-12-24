# Pipelines and filters

1. Using the pipe operator "`|`" (vertical bar), the standard output
   (stdout) of a command can be _piped_ to the standard input (stdin)
   of another command. This is a powerful feature that allows us to
   perform complex operations on data by combining simple
   utilities. Let's see some examples:

   `ls -l /usr/bin`{{execute}}

   `ls -l /usr/bin | less`{{execute}}

2. We can sort the data with `sort`:

   `ls /bin /usr/bin`{{execute}}

   `ls /bin /usr/bin | sort | less`{{execute}}

3. `uniq` can omit or report repeated lines:

   `ls /bin /usr/bin | sort | uniq | less`{{execute}}

   If we want to see the list of duplicates instead we can use the
   option `-d`:
   
   `ls /bin /usr/bin | sort | uniq -d | less`{{execute}}

4. `wc` counts the lines, words, and bytes of the input:

   `wc ls-output.txt`{{execute}}
   
   `cat ls-output.txt | wc`{{execute}}
   
   If we want it to show only the lines we can use the option `-l`:
   
   `ls /bin /usr/bin | sort | wc -l`{{execute}}

   `ls /bin /usr/bin | sort -u | wc -l`{{execute}}

   `ls /bin /usr/bin | sort | uniq -d | wc -l`{{execute}}

5. `grep` prints the lines that match a given pattern:

   `ls /bin /usr/bin | sort -u | grep zip`{{execute}}
   
   `ls /bin /usr/bin | sort -u | grep zip | wc -l`{{execute}}
   
   The option `-v` shows the lines that do match the pattern:
   
   `ls /bin /usr/bin | sort -u | grep -v zip`{{execute}}
   
   `ls /bin /usr/bin | sort -u | grep -v zip | wc -l`{{execute}}
   
   The option `-i` can be used if we want grep to ignore case when
   searching (case in-sensitive search).
   
6. `head` / `tail` print the top or the last lines of input:

   `ls /usr/bin > ls-output.txt`{{execute}}

   `head ls-output.txt`{{execute}}
   
   `tail ls-output.txt`{{execute}}
   
   `tail -n 5 ls-output.txt`{{execute}}
   
   `tail -5 ls-output.txt`{{execute}}
   
   `ls /usr/bin | head -n 5`{{execute}}
   
   `tail /var/log/syslog -n 20`{{execute}}
   
   `tail /var/log/syslog -f`{{execute}}
   
   The option `-f` makes it follow the latest changes of the file in
   real time. Press "Ctrl-c" to terminate it.
   
7. `tee` sends its input both to stdout and to files:

   `ls /usr/bin | tee ls.txt | grep zip`{{execute}}
   
   `ls -l ls.txt`{{execute}}
   
   `less ls.txt`{{execute}}
