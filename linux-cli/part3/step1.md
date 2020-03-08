# Searching for files

1. We can make a quick search for files with `locate`:

   `locate bin/zip`{{execute}}
   
   No results! This can't be right because:
   
   `ls -l /usr/bin/zip`{{execute}}
   
   The problem is that `locate` uses a database that is updated daily
   by running the command `updatedb`. Right now the database is not
   created yet, so let's run this command manually and try again:
   
   `updatedb`{{execute}}
   
   `locate bin/zip`{{execute}}
   
   If the search requirement is not so simple, we can combine `locate`
   with other tools, like `grep`:
   
   `locate zip | grep bin`{{execute}}
   
   `locate zip | grep bin | grep -v overlay`{{execute}}
   
2. While `locate` searches are based only on the file name, with
   `find` we can also make searches based on other attributes of files.
   
   It takes as arguments one or more directories that are to be
   searched:
   
   `ls -aR ~`{{execute}}
   
   `find ~`{{execute}}
   
   To find only directories we can use the option `-type d` and to
   find only files we can use `-type f`:
   
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
   
   `-2k` matches the files whose size is less than 2 Kilobytes, `2k`
   those who are exactly 2 Kilobytes, and `+2k` those who are more
   than 2 Kilobytes. Besides `k` we can also use `M` for Megabytes,
   `G` for Gigabytes, etc.

4. `find` supports many other tests on files and directories, like the
   time of creation or modification, the ownership, permissions, etc.
   These tests can be combined with _logical operators_ to create more
   complex logical relationships. For example:
   
   `find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)`{{execute}}

   This looks weird, but if we try to translate it to a more
   understandable language it means: find on home directory ( files
   with bad permissions ) -or ( directories with bad permissions ).
   We have to escape the parentheses to prevent shell from
   interpreting them.

5. We can also do some actions on the files that are found. The
   default action is to `-print` them to the screen, but we can also
   `-delete` them:
   
   `touch test(1,2,3}.bak`{{execute}}
   
   `ls`{{execute}}
   
   `find . -type f -name '*.bak' -delete`{{execute}}
   
   `ls`{{execute}}
   
   `touch test(1,2,3}.bak`{{execute}}
   
   `find . -type f -name '*.bak' -print -delete`{{execute}}
   
   `ls`{{execute}}
   
   We can also execute custom actions with `-exec`:

   `touch test(1,2,3}.bak`{{execute}}
   
   `ls`{{execute}}
   
   `find . -name '*.bak' -exec rm '{}' ';'`{{execute}}
   
   `ls`{{execute}}

   Here `{}` represents the pathname that is found and `;` is required
   to indicate the end of the command. Both of them have been quoted
   to prevent shell from interpreting them.
   
   If we use `-ok` instead of `-exec` then each command will be confirmed
   before being executed:

   `touch test(1,2,3}.bak`{{execute}}
   
   `ls`{{execute}}
   
   `find . -name '*.bak' -ok rm '{}' ';'`{{execute}}
   
6. Another way to perform actions on the results of `find` is to pipe
   them to `xargs`, like this:
   
   `touch test(1,2,3}.bak`{{execute}}
   
   `ls`{{execute}}
   
   `find . -name '*.bak' | xargs echo`{{execute}}
   
   `find . -name '*.bak' | xargs ls -l`{{execute}}
   
   `find . -name '*.bak' | xargs rm`{{execute}}
   
   `ls`{{execute}}
   
   `xargs` gets input from stdin and converts it into an argument list
   for the given command.
