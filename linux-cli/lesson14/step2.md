# Group commands. Subshells. Process substitutions.

1. Group commands and subshells.

   Group command: `{ command1; command2; [command3; ...] }`
   
   Subshell: `(command1; command2; [command3;...])`
   
   Because of the way bash implements group commands, the braces must
   be separated from the commands by a space and the last command must
   be terminated with either a semicolon or a newline prior to the
   closing brace.

   Group commands and subshells are both used to manage redirection:
   
   `date > foo.txt`{{execute}}

   ```
   ls -l > output.txt
   echo "Listing of foo.txt" >> output.txt
   cat foo.txt >> output.txt
   ```{{execute}}
   
   `{ ls -l; echo "Listing of foo.txt"; cat foo.txt; } > output.txt`{{execute}}
   
   `(ls -l; echo "Listing of foo.txt"; cat foo.txt) > output.txt`{{execute}}
   
   `{ ls -l; echo "Listing of foo.txt"; cat foo.txt; } | less`{{execute}}

2. Let's see an example that prints a listing of the files in a
   directory, along with the names of the file's owner and group
   owner. At the end of the listing, the script prints a tally of the
   number of files belonging to each owner and group.

   `./array-2.sh /usr/bin`{{execute}}
   
   `vim array-2.sh`{{execute}}
   
3. A group command (`{ . . . }`) executes all of its commands in the
   current shell.
   
   A subshell (`( . . . )`), as the name suggests, executes its
   commands in a child copy of the current shell. This means the
   environment is copied and given to a new instance of the
   shell. When the subshell exits, the copy of the environment is
   lost, so any changes made to the subshell’s environment (including
   variable assignment) are lost as well. Therefore, in most cases,
   unless a script requires a subshell, group commands are preferable
   to subshells. Group commands are both faster and require less
   memory.
   
   We have seen before that using `read` with pipe does not work as we
   might expect:
   
   `echo "foo" | read`{{execute}}
   
   `echo $REPLY`{{execute}}
   
   This is because the shell executes the command after the pipe
   (`read` in this case) in a subshell. The command `read` assigns a
   value to the variable `REPLAY` in the environment of the subshell,
   but once the command is done executing, the subshell and its
   environment are destroyed. So, the variable `REPLAY` of the current
   shell still is unassigned (does not have a value).

4. To work around this problem, shell provides a special form of
   expansion, called _process substitution_.

   For processes that produce standard output it looks like this:
   `<(list-of-commands)`

   For processes that intake standard input it looks like this:
   `>(list-of-commands)`

   To solve our problem with read, we can employ process substitution
   like this:
   
   `read < <(echo "foo")`{{execute}}
   
   `echo $REPLY`{{execute}}
   
   What is happening is that _process substitution_ allows us to treat
   the output of a subshell as an ordinary file for purposes of
   redirection.

   `echo <(echo "foo")`{{execute}}
   
   By using `echo` we see that the output of the subshell is being
   provided by a file named `/dev/fd/63`.

5. Let's see an example of a `read` loop that processes the contents
   of a directory listing created by a subshell:

   `vim pro-sub.sh`{{execute}}
   
   Because we are using `read`, we cannot use a pipe to send data to
   it.
   
   `./pro-sub.sh`{{execute}}
   
   `./pro-sub.sh /usr/bin | less`{{execute}}
