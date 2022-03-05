# Reading keyboard input

1. The script `test-integer2.sh`, that we have seen previously, has
   the value of `INT` hardcoded, so that we need to edit the script in
   order to test another value. We can make it more interactive by
   using the command `read`:
   
   `vim read-integer.sh`{{execute}}
   
   `:wq`{{execute}}
   
   `./read-integer.sh`{{execute}} `0`{{execute}}
   
   `./read-integer.sh`{{execute}} `7`{{execute}}
   
   `./read-integer.sh`{{execute}} `4`{{execute}}
   
   `./read-integer.sh`{{execute}} `-3`{{execute}}
   
   `./read-integer.sh`{{execute}} `-8`{{execute}}
   
   The command read assigns the input to the variable `int`. If no
   variable name is given, then it assigns the input to the variable
   `REPLY`. 
   
2. The command `read` can also get multiple variable names, as in this
   example:
   
   `vim read-multiple.sh`{{execute}}
   
   In this script, we assign and display up to five values.
   
   `:q!`{{execute}}
   
   `./read-multiple.sh`{{execute}}
   
   `a b c d e`{{execute}}
   
   `./read-multiple.sh`{{execute}}
   
   `a b`{{execute}}
   
   `./read-multiple.sh`{{execute}}
   
   `a b c d e f g`{{execute}}
   
3. It can also get some options:

   `help read | less`{{execute}}
   
   With the `-p` option we can provide a prompt string:

   `read -p "Enter one or more values > "`{{execute}}
   
   `a b c`{{execute}}
   
   `echo "REPLY = '$REPLY'"`{{execute}}
   
   The option `-s` can be used for a silent input, and `-t` to set a
   timeout. Let's see them in an example that tries to read a
   password:
   
   `vim read-user-pass.sh`{{execute}}
   
   `./read-user-pass.sh`{{execute}}
   
   If we don't type a password in 10 seconds, the `read` command will
   time out with an error exit code.
      
4. The input provided to `read` is split by the shell. There is a
   shell variable named `IFS` (Internal Field Separator) which
   contains a list of separators. By default it contains a space, a
   tab, and a newline character. Each of them can separate items from
   each-other.
   
   If we want to modify the way that the input is separated into
   fields, we can change the value of `IFS`.
   
   `vim read-ifs.sh`{{execute}}
   
   Notice that we set `IFS=":"` before calling `read`. The shell
   allows one or more variable assignments to take place immediately
   before a command. These assignments alter the environment for the
   command that follows. The effect of the assignment is temporary
   changing the environment, for the duration of the command.
   
   It is the same as doing this, but more concise:
   
   ```bash
   OLD_IFS="$IFS"
   IFS=":"
   read user pw uid gid name home shell <<< "$file_info"
   IFS="$OLD_IFS"
   ```
   
   The `<<<` operator indicates a _here string_. A here string is like
   a here document, only shorter, consisting of a single string. We
   need to use it because `read` does not work well with a pipe (for
   example: `echo "$file_info" | read ...`)
   
   `:q!`{{execute}}
   
   `./read-ifs.sh`{{execute}}
   
   `xyz`{{execute}}

   `./read-ifs.sh`{{execute}}
   
   `root`{{execute}}
