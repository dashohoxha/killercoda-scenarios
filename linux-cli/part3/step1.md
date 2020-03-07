# Searching for files

1. We can make a quick search for fils with `locate`:

   `locate bin/zip`{{execute}}
   
   No results! This can't be right because:
   
   `ls -l /usr/bin/zip`{{execute}}
   
   The problem is that `locate` uses a database that is updated daily
   by running the command `updatedb`. Right now the database is not
   created yet, so let's run this command manyally and try again:
   
   `updatedb`{{execute}}
   
   `locate bin/zip`{{execute}}
   
   If the search requirement is not so simple, we can combine `locate`
   with other tools, like `grep`:
   
   `locate zip | grep bin`{{execute}}
   
   `locate zip | grep bin | grep -v overlay`{{execute}}
   
2. While `locate` searches are based only on the file name, with
   `find` we can also make seraches based on other attributes of files.
   
   It takes as arguments one or more directories that are to be
   searched:
   
   `ls -laR ~`{{execute}}
   
   `find ~`{{execute}}
   
   To find only directories we can use the option `-type d` and to
   find only files we can use `-type -f`:
   
   `find . -type d`{{execute}}
   
   `find . -type f`{{execute}}
   
   `find . -type d | wc -l`{{execute}}
   
   `find . -type f | wc -l`{{execute}}
   
   `find . | wc -l`{{execute}}
   
3. We can also search by filename and file size:

   `find /etc -type f | wc -l`{{execute}}
   
   `find /etc -type f -name "*.conf" | wc -l`{{execute}}
   
   We enclose the search pattern in double quotes to prevent shell
   from expanding "`*`".

   `find /etc -type f -name "*.conf" -size -2k | wc -l`{{execute}}
   
   `find /etc -type f -name "*.conf" -size 2k | wc -l`{{execute}}
   
   `find /etc -type f -name "*.conf" -size +2k | wc -l`{{execute}}
   
   `-2k` mathes the files whose size is less than 2 Kilobytes, `2k`
   those who are exactly 2 Kilobytes, and `+2k` those who are more
   than 2 Kilobytes. Besides `k` we can also use `M` for Megabytes,
   `G` for Gigabytes, etc.

4. 
