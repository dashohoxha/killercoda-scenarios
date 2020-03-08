# More examples with `find`

1. Let's create some test files:

   `mkdir -p test/dir-{001..100}`{{execute}}
   
   `touch test/dir-{001..100}/file-{A..Z}`{{execute}}
   
   The command `touch` in this case creates empty files.
   
   `ls test/`{{execute}}
   
   `ls test/dir-001/`{{execute}}
   
   `ls test/dir-002/`{{execute}}
   
2. Find all the files named `file-A`:
   
   `find test -type f -name 'file-A'`{{execute}}

   `find test -type f -name 'file-A' | wc -l`{{execute}}

3. Create a timestamp file:

   `touch test/timestamp`{{execute}}
   
   This creates an empty file and sets its modification time to the
   current time. We can verify this with `stat` which shows
   everything that the system knows about a file:

   `stat test/timestamp`{{execute}}

   `touch test/timestamp`{{execute}}

   `stat test/timestamp`{{execute}}

   We can see that after the second `touch` the times have been
   updated.
   
4. Next, let's use `find` to update all files named `file-B`:
   
   `find test -name 'file-B' -exec touch '{}' ';'`{{execute}}
   
5. Now let's use `find` to identify the updated files by
   comparing them to the reference file `timestamp`:
   
   `find test -type f -newer test/timestamp`{{execute}}
   
   `find test -type f -newer test/timestamp | wc -l`{{execute}}
   
   The result contains all 100 instances of `file-B`. Since we did a
   `touch` on them after updating `timestamp`, they are now "newer"
   that it.

6. Let's find again the files and directories with bad permissions:

   `find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)`{{execute}}

   `find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \) | wc -l`{{execute}}

7. Let's add some actions to the command above in order to fix the
   permissions:
   
   `find ~ \( -type f -not -perm 0600 -exec chmod 0600 '{}' ';' \) -or \( -type d -not -perm 0700 -exec chmod 0700 '{}' ';' \)`{{execute}}
   
   The command `chmod` sets the permissions of a file or directory (we
   will see the permissions later).

   `find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)`{{execute}}

   `find ~ \( -type f -perm 0600 \) -or \( -type d -perm 0700 \)`{{execute}}

   `find ~ \( -type f -perm 0600 \) -or \( -type d -perm 0700 \) | wc -l`{{execute}}

   **Note:** This is a bit complex for the sake of example, however we
   could have done it in two simpler steps, like this:
   
   `find ~ -type f -not -perm 0600 -exec chmod 0600 '{}' ';'`{{execute}}

   `find ~ -type d -not -perm 0700 -exec chmod 0700 '{}' ';'`{{execute}}

8. Let's try some more tests:
