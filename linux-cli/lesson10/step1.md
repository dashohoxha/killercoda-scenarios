# Create and run a script

1. Let's create a script that prints "Hello World!".

   `vim hello.sh`{{execute}}
   
   `i`{{execute no-newline}}
   
   ```
   #!/bin/bash
   # this is the first script

   echo 'Hello World!'
   ```{{execute}}
   
   `^ESC`{{execute ctrl-seq}} `:wq`{{execute}}
   
   `ls -l hello.sh`{{execute}}
   
   `cat hello.sh`{{execute}}
   
   `cat hello.sh | bash`{{execute}}
   
   `bash hello.sh`{{execute}}
   
   We are sending it to `bash`, and bash is interpreting and executing
   the commands inside the script.
   
2. Let's make the script executable:

   `chmod +x hello.sh`{{execute}}
   
   `ls -l hello.sh`{{execute}}
   
   Let's try to execute it:
   
   `hello.sh`{{execute}}
   
   It says `command not found`. This is because the shell looks for
   this command on certain directories, which are listed on the
   environment variable `PATH`:
   
   `echo $PATH`{{execute}}
   
   There is no command `hello.sh` in any of these directories, so
   shell cannot find such a command.
   
   To fix this problem we can add the current directory to the `PATH`:
   
   `PATH="$(pwd):$PATH"`{{execute}}
   
   `echo $PATH`{{execute}}
   
   `hello.sh`{{execute}}
   
   Another way is to tell bash the path of the command, like this:
   
   `./hello.sh`{{execute}}
   
   When we give a path to the command (`./` in this case), the shell
   does not use the variable `PATH` but tries to find the command in
   the given path.

3. The _shebang_.

   The character `#` is usually called _hash_, and `!` is usually
   called _bang_. Together they are called _shebang_ and they are
   placed at the very beginning of a script (no empty lines and no
   empty spaces before them). They tell the shell how to interpret the
   script. In our case `/bin/bash` comes after them, so the script
   will be sent to `/bin/bash` to interpret it. The same way can be
   used to interpret a Python script etc. For example, in the case
   of a python script the fitsy line would be like this:
   
   `#!/usr/bin/python3`
   
4. Comments are denoted by a `#`. Everything after a `#` is considered
   a comment and is ignored by the bash interpreter.
   
   `echo 'Hello'   # this is a comment`{{execute}}
