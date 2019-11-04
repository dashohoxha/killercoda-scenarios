# Basic commands

1. When `pw` is used for the first time, it creates automatically a
   password archive, protected by a passphrase:

   `cd`{{execute T1}}
   
   `pw`{{execute}}
   
2. Let's set some test entries:
   
   `set test`{{execute}}
   
   `set test2`{{execute}}
   
   `ls`{{execute}}
   
   `get test2`{{execute}}
   
   `show test2`{{execute}}
   
   `test2`{{execute}}
   
   `ls test2`{{execute}}

3. Password entries can be categoriezed in directories and
   subdirectories:
   
   `set dir1/test3`{{execute}}
   
   `set dir1/test4`{{execute}}
   
   `ls`{{execute}}
   
   `ls -t`{{execute}}
   
   `ls dir1`{{execute}}
   
   `ls dir1 -t`{{execute}}
   
   `ls dir1/test4`{{execute}}
   
4. Instead of `set` we can use `gen` to generate stong passwords:
   
   `gen`{{execute}}
   
   `gen dir2/test5`{{execute}}
   
   `gen dir1/test4 16 -n`{{execute}}
   
   `show dir1/test3`{{execute}}
   
   `gen dir1/test3 16 -n -f`{{execute}}
   
   `dir1/test3`{{execute}}
