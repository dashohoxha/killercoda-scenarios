# Some commands about commands

1. The command `type` displays a command's type:

   `type type`{{execute}}
   
   `type ls`{{execute}}
   
   `type cp`{{execute}}
   
   The command `cp` is an executable program located on `/bin/cp`.
   
2. The command `which` displays the location of an executable:

   `which ls`{{execute}}
   
   `which cd`{{execute}}
   
   The command `cd` is not an executable but a shell builtin command.
   
   `type cd`{{execute}}
   
3. The command `help` displays a help page for the shell builtin
   commands:

   `help cd`{{execute}}
   
   `help mkdir`{{execute}}
   
   The command `mkdir` is not a shell builtin.
   
4. The option `--help` displays usage information:

   `mkdir --help`{{execute}}
   
5. The command `man` displays the manual page of a program:

   `man ls`{{execute}}
   
   Manual pages are organized into different sections, where section 1
   for example is about user commands, and section 5 is about file
   formats. So, these two commands will display different manual pages:
   
   `man passwd`{{execute}}
   
   `man 5 passwd`{{execute}}
   
6. The command `info` is another way to display manual pages:

   `info coreutils`{{execute}}
   
   `info passwd`{{execute}}
   
7. The command `apropos` displays appropriate commands:

   `apropos passwd`{{execute}}
   
   This is the same as:
   
   `man -k passwd`{{execute}}
   
   It makes a simple search of man pages for the term "passwd".
   
8. The command `whatis` displays a very brief description of a
   command:
   
   `whatis ls`{{execute}}
   
9. The command `alias` is used to create new commands.

   `alias --help`{{execute}}
   
   `alias`{{execute}}
   
   `type alias`{{execute}}
   
   `type ls`{{execute}}
   
   `cd /usr; ls; cd -`{{execute}}
   
   `type foo`{{execute}}
   
   `alias foo="cd /usr; ls; cd -"`{{execute}}
   
   `type foo`{{execute}}
   
   `foo`{{execute}}
   
   `unalias foo`{{execute}}
   
   `type foo`{{execute}}
   
