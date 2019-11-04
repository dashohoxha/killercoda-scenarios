# Other topics

1. So far we have always used the `pw` commands from its shell. But we
   can also give them on the command line, without having to enter the
   shell. This might be useful in scripts.

   `pw ls -t`{{execute}}
   
   `pw show dir1/test3`{{execute}}
   
   `pw dir1/test3`{{execute}}
   
   `pw edit dir1/test4`{{execute}}
   
   `pw show dir1/test4`{{execute}}
   
   `pw rm test6`{{execute}}
   
   `pw ls -t`{{execute}}
   
   `pw -a archive2 ls -t`{{execute}}
   
2. If the name of an entry contains spaces, enclose it in quotes:

   ```
   pw -a archive2 \
      set "dir1/test 5" --multiline
   ```{{execute}}
   
   Type this and then press Ctrl+D:
   
   ```
   password
   line 2
   line 3
   ```{{execute}}
  
   ```
   pw -a archive2 \
      show "dir1/test 5"
   ```{{execute}}
   
   `pw -a archive2 ls -t`{{execute}}
   
   ```
   pw -a archive2 \
      gen "dir1/test 5" 40 \
      --no-symbols --in-place
   ```{{execute}}

   ```
   pw -a archive2 \
      show "dir1/test 5"
   ```{{execute}}
   
3. Change the passphrase of an archive:

   `pw -a archive2 set-passphrase`{{execute}}
   
   `pw pass`{{execute}}
