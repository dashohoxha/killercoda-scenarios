# The Environment

We have seen previously some _environment variables_. These are
variables that are maintained by the shell and are used to store some
settings. They can also be used by some programs to get configuration
values.

1. We can display a list of environment variables with `printenv` or
   `set`:
   
   `printenv | less`{{execute}}
   
   `set | less`{{execute}}
   
   The list displayed by `set` is longer because it displays also
   shell variables and some functions defined in the shell.
   
   `printenv USER`{{execute}}
   
   `echo $USER`{{execute}}
   
   The `USER` variable basically keeps the value that is displayed by
   the command `whoami`.
   
2. Some other interesting environment vars are these:

   `echo $HOME`{{execute}}
   
   `echo $PWD`{{execute}}
   
   `echo $SHELL`{{execute}}
   
   `echo $LANG`{{execute}}
   
   `echo $PATH`{{execute}}
   
   `PATH` is used by shell to find a program. For example when we call
   `ls`, shell is looking for it in the first directory of the PATH,
   then in the second, and so on. The command `which ls`{{execute}}
   shows us where the shell finds the program `ls`.

3. The environment variables are declared in some configuration files
   that the shell loads when it starts. There two kinds of shells: a
   _login_ shell session, which is started when we are prompted for a
   username and password, and a _non-login_ shell session, which is
   started when we launch a terminal.
   
   The configuration scripts that loads a _login_ shell:
   
   `nano /etc/profile`{{execute}}
   
   `nano ~/.profile`{{execute}}
   
   Note: Type **Ctrl-x** to exit from `nano`.
   
   The configuration scripts that loads a _non-login_ shell:
   
   `nano /etc/bash.bashrc`{{execute}}
   
   `nano ~/.bashrc`{{execute}}
   
   However the non-login shell inherits the environment variables from
   the parent process, usually a login shell, and the config scripts
   of a login shell usually include the config scripts of a non-login
   shell. So, if we want to make some changes to the environment, the
   right place to edit is the file `~/.bashrc`.

4. Let's say that we want to modify the variable HISTSIZE, which keeps
   the size of the command history.
   
   `echo $HISTSIZE`{{execute}}
   
   `nano ~/.bashrc`{{execute}}
   
   Add this line at the end of the file:
   
   `export HISTSIZE=2000`{{execute}}
   
   Press Ctrl-o and Enter to save the changes. Then Ctrl-x to exit.
   
   With `HISTSIZE=2000` we are giving a new value to the variable, and
   the command `export` actually saves it to the environment of the
   shell.
   
   Next time that we will start a shell it will load `~/.bashrc` and a
   new value will be set to HISTSIZE. But we can also load `~/.bashrc`
   with the command `source`, so that the changes are applied right
   now:
   
   `echo $HISTSIZE`{{execute}}
   
   `source ~/.bashrc`{{execute}}

   `echo $HISTSIZE`{{execute}}
   
5. One of the environment variables is also `PS1` which defines the
   prompt:
   
   `echo $PS1`{{execute}}
   
   Let's try to play with it, but first let's backup the current
   value:
   
   `ps1_old="$PS1"`{{execute}}
   
   `echo $ps1_old`{{execute}}
   
   If we need to restore we can do it like this:
   
   `PS1="$ps1_old"`{{execute}}
   
   Let's try some other prompts:
   
   `PS1="--> "`{{execute}}
   
   `ls -al`{{execute}}
   
   `PS1="\$ "`{{execute}}
   
   `ls -al`{{execute}}
   
   `PS1="\A \h \$ "`{{execute}}
   
   `ls -al`{{execute}}
   
   "\A" displays the time of day and "\h" displays the host.
   
   `PS1="<\u@\h \W>\$ "`{{execute}}
   
   `ls -al`{{execute}}
   
   "\u" displays the user and "\W" displays the name of the current
   directory.
   
   To save this prompt for future sessions of the shell, we should
   append this line to `~/.bashrc`:
   
   `export PS1="<\u@\h \W>\$ "`{{execute}}
