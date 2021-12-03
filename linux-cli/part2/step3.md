# Command history

1. The history of the typed commands is kept on `~/.bash_history`:

   `echo $HISTFILE`{{execute}}
   
   `ls $HISTFILE`{{execute}}
   
   Bash maintains the list of commands internally in memory while it's
   running, and writes it to the history file on exit. That's why we
   don't see yet the history file. Let's tell Bash to append the
   command list to the history file now:
   
   `history -a`{{execute}}
   
   `ls $HISTFILE`{{execute}}
   
   `tail $HISTFILE`{{execute}}
   
   `less $HISTFILE`{{execute}}
   
2. The command `history` can also be used to display the history list:

   `history`{{execute}}
   
   `history | less`{{execute}}
   
   `history | tail`{{execute}}
   
   `history | tail -n 20`{{execute}}
   
   `history | grep man`{{execute}}
   
3. We can re-run a previous command like this:

   `!67`{{execute}}
   
   Rerun the command which has the given number.
   
   `!ls`{{execute}}
   
   Rerun the last command that _starts_ with `ls`.
   
   `!?passwd`{{execute}}
   
   Rerun the last command that _contains_ `passwd`.
   
   `history | grep passwd`{{execute}}
   
4. We can recall the previous commands also by pressing the _up-arrow_
   multiple times.

5. However the most useful way to rerun previous commands is searching
   interactively, with keyboard shortcuts.
   
   For example typing "Ctrl-r" will start a reverse incremental
   search. It is "reverse" because it searches backwards in the
   history list, starting from the last command. While we start typing
   the search text it will display the last command that matches it.
   If we are happy with the search result we can just press enter to
   rerun it, or we can use the left and right arrows to edit it first
   and then press [Enter] to run it. Otherwise we can keep pressing
   "Ctrl-r" to get the next matching command, and so on.
   
   Let's try it:
   
   1. Press "Ctrl-r".
   
   2. Type "pass".
   
   3. Press "Ctrl-r" again.
   
   4. Press "Ctrl-r" again.
   
   5. Press "Enter".
