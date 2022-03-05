# Branching with `if`

The if statement has the following syntax:

```
if commands; then
    commands
[elif commands; then
    commands...]
[else
    commands]
fi
```

1. Commands (including the scripts and shell functions) return an
   _exit status_. By convention, an exit status of zero indicates
   success and any other value indicates failure.

   `ls -d /usr/bin`{{execute}}
   
   `echo $?`{{execute}}

   `ls -d /bin/usr`{{execute}}
   
   `echo $?`{{execute}}

   The builtin commands `true` and `false` do nothing except returning
   an exit status:
   
   `true`{{execute}}
   
   `echo $?`{{execute}}

   `false`{{execute}}

   `echo $?`{{execute}}

2. The `if` statement evaluates the success or failure of the
   commands, based on their exit status:
   
   `if true; then echo "It's true."; fi`{{execute}}
   
   `if false; then echo "It's true."; fi`{{execute}}

   If a list of commands follows `if`, the last command in the list is
   evaluated:
   
   `if false; true; then echo "It's true."; fi`{{execute}}
   
   `if true; false; then echo "It's true."; fi`{{execute}}
   
3. The command used most frequently with `if` is `test`, which
   performs a variety of checks and comparisons.

   `touch foo.txt`{{execute}}

   `if test -e foo.txt; then echo "File exists"; fi`{{execute}}
   
   `if [ -e foo.txt ]; then echo "File exists"; else echo "File does not exist"; fi`{{execute}}
   
   The command `[` is equivalent to `test` (it requires `]` as the
   last argument).

   `rm -f foo.txt`{{execute}}
   
   `if [ -e foo.txt ]; then echo "File exists"; else echo "File does not exist"; fi`{{execute}}
   
4. Let's see an example script that is testing files:
   
   `./test-file.sh`{{execute}}

   `vim test-file.sh`{{execute}}
   
   Notice that the parameter `$FILE` is quoted within the
   expression. This is not required, but it is a defense against the
   parameter being empty or containing only whitespace.
   
   Notice also the `exit` command at the end. It can optionally take a
   number as an argument, which becomes the exit status of the script,
   indicating success or failure. Without an argument, the default is
   the exit status of the last command executed. If the command `exit`
   is not present at all, the exit status of the script will be the
   exit status of the last command executed.
   
   `:q!`{{execute}}
   
   Let's see a similar example that uses a function instead:
      
   `vim test-file-fun.sh`{{execute}}
   
   Notice that instead of `exit`, a function can use `return` to
   indicate the exit status of the function.
   
   `:q!`{{execute}}
   
   `./test-file-fun.sh`{{execute}}
   
5. An example with testing strings:

   `./test-string.sh`{{execute}}

   `vim test-string.sh`{{execute}}
   
   Notice that when there is an error (`ANSWER` is empty), we print
   the error message to `stderr` by redirecting the output of `echo`
   (`>&2`). We also return an exit code of 1 by `exit 1`.
   
   `:q!`{{execute}}
   
   A similar example with testing integers:
   
   `vim test-integer.sh`{{execute}}

   `:q!`{{execute}}
   
   `./test-integer.sh`{{execute}}
   
   For more details about the available tests let's see the help:
   
   `help test | less`{{execute}}

   `help [`{{execute}}
