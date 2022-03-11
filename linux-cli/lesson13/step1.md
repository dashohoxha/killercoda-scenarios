# Looping with `for`

1. With `for` we can loop a list of words:

   `for i in A B C D; do echo $i; done`{{execute}}
   
   `for i in {A..D}; do echo $i; done`{{execute}}
      
   `for i in *.sh; do echo "$i"; done`{{execute}}
   
   In these cases it is using shell expansions.
   
   The last file expansion may fail if there are no files like that,
   in which case shell will return just `*.sh` (instead of a list of
   matching files). To protect against this, we can rewrite the last
   example like this:

   `for i in *.sh; do [[ -e "$i" ]] && echo "$i"; done`{{execute}}
   
2. Let's see an example that finds the longest word in a file:

   `vim longest-word.sh`{{execute}}
   
   Actually it can take one or more files as parameters and process
   each of them. This is implemented by the `while` loop:
   
   ```
   while [[ -n "$1" ]]; do
       if [[ -r "$1" ]]; then
           # . . . . .
	       # . . . . .
	   fi
       shift
   done
   ```

   The `if` checks that the file is readable (otherwise it is
   skipped).

   The list of words of the file is produced by the command `strings
   "$1"`. We use a _command substitution_ to use this list in the for
   statement:
   
   `for i in $(strings "$1"); do`
   
   Notice that we are not surrounding `$(strings "$1")` with double
   quotes, otherwise it will be treated as a single string, which is
   not what we want.
   
   Let's try it:
   
   `echo *`{{execute}}
   
   `./longest-word.sh *`{{execute}}

3. Let's see a slightly modified version of the previous example:

   `vim longest-word2.sh`{{execute}}

   The modification consists on replacing the `while` loop with a
   `for` loop like this:
   
   ```
   for i; do
       if [[ -r "$i" ]]; then
           # . . . . .
	       # . . . . .
	   fi
   done
   ```
   
   And since we are using the variable `i` for the outer loop, in the
   inner loop we have replaced `i` with `j`.
   
   When we omit the list of words, `for` will use by default the
   positional parameters.

   `echo *`{{execute}}

   `./longest-word2.sh *`{{execute}}

4. `for` has also another form, which is similar to that of C (and
   many other languages):
   
   `for ((i=0; i<5; i=i+1)); do echo $i; done`{{execute}}

   As you know, the construct `((...))` is used for arithmetic
   expressions, and inside it we don't use a `$` in front of
   the variables.

5. Let's also make a small modification to the program `sys_info.sh`
   that we saw in the last lesson:
   
   `vim sys_info.sh`{{execute}}
   
   Only the last function (`report_home_space ()`) has been modified.
   It provides more detail for each user’s home directory and includes
   the total number of files and subdirectories in each. We also use
   some local variables and use `printf` (instead of `echo`) to format
   some of the output.
   
   `./sys_info.sh > report.html`{{execute}}
   
   `lynx report.html`{{execute}}
   
   `qy`{{execute}}
