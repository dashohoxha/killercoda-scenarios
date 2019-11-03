# More advanced commands

1. Rename and move around password entries with `mv`:
   
   `mv`{{execute}}
   
   `ls -t`{{execute}}
   
   `mv dir2/test5 dir2/test6`{{execute}}
   
   `ls -t`{{execute}}
   
   `mv dir2 dir3`{{execute}}
   
   `ls -t`{{execute}}
   
2. Copy password entries with `cp`:
   
   `cp`{{execute}}
   
   `cp dir3/test6 dir1/test5`{{execute}}
   
   `ls -t`{{execute}}
   
   `dir3/test6`{{execute}}
   
   `dir1/test5`{{execute}}
   
   `cp dir3/test6 test5`{{execute}}
   
   `ls -t`{{execute}}
   
3. Remove entries with `rm`:
   
   `rm`{{execute}}
   
   `rm test -f`{{execute}}
   
   `ls -t`{{execute}}
   
   `rm dir3`{{execute}}
   
   `rm dir3 -r`{{execute}}
   
   `ls -t`{{execute}}
   
   `cp dir1 dir2`{{execute}}
   
   `ls -t`{{execute}}
   
   `rm dir2 -rf`{{execute}}
   
   `ls -t`{{execute}}

4. Commands `edit` and `grep`.

   The first line of a password entry is the password itself. The rest
   of the lines can be anything else, like a username, a url address,
   a note, etc. We can add these extra lines with the command `edit`.
   
   For example edit `dir1/test3` and add `username: xyz` as the second
   line, and then add `third line`:
   
   `edit`{{execute}}
   
   `edit dir1/test3`{{execute}}
   
   `dir1/test3`{{execute}}

   `show dir1/test3`{{execute}}

   Once you have entered more information on password entires, you can
   use `grep` to search them:
   
   `grep`{{execute}}
   
   `grep xyz`{{execute}}
   
   `grep line`{{execute}}

5. Commands `find` and `log`:

   `find`{{execute}}
   
   `find test`{{execute}}
   
   `find 5`{{execute}}
   
   `find 2`{{execute}}
   
   `find 1`{{execute}}
   
   `log`{{execute}}
   
   `log -10`{{execute}}
   
   `log -5`{{execute}}
