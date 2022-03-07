# Positional parameters

1. The shell provides a set of variables called _positional
   parameters_ that contain the individual words on the command line.
   
   Let's test them with a simple script:
   
   `vim posit-param.sh`{{execute}}
   
   `./posit-param.sh`{{execute}}
   
   `$(pwd)/posit-param.sh`{{execute}}
   
   Notice that `$0` contains the the first word of the command, which
   is the name and path of the command itself.
   
   `./posit-param.sh a b c d`{{execute}}
   
   The special variable `$#` contains the number of arguments.
   
   If we need to use more than 9 arguments, then we can use `${10}`,
   `${11}` etc. to access them.
   
2. The `shift` command causes all the parameters to "move down one"
   each time it is executed.
   
   `vim posit-param2.sh`{{execute}}
   
   In this example there is a loop that evaluates the number of
   arguments remaining and continues as long as there is at least one.

   `./posit-param2.sh a b c d`{{execute}}

3. Here is another example:

   `vim file-info.sh`{{execute}}
   
   This program displays the file type (determined by the `file`
   command) and the file status (from the `stat` command) of a
   specified file.
   
   It checks the first argument, and if it does not exist, exits with
   an error message that shows how to use this script.
   
   The command `basename` gets only the name of the file (discarding
   the path).
   
   `./file-info.sh`{{execute}}
   
   `./file-info.sh posit-param2.sh`{{execute}}
   
   `./file-info.sh .`{{execute}}
   
   `./file-info.sh xyz`{{execute}}
      

4. Positional parameters can be used with functions as well.

   `vim file-info-fun.sh`{{execute}}
   
   Notice that `$0` always contains the full pathname of the first
   item on the command line (i.e., the name of the program), even
   inside a function.

   Notice also that `FUNCNAME` is a variable that always contains the
   name of the current function.
   
   `./file-info.sh`{{execute}}
   
5. The shell provides two special variables that contain the list of
   all the positional parameters. They are `$*` and `$@`. Let's try
   an example that shows their differences:
   
   `vim posit-param3.sh`{{execute}}
   
   `./posit-param3.sh`{{execute}}
   
   You see that both `$*` and `$@` give 4 parameters. `"$*"` gives a
   single parameter, and `"$@"` gives back the two original
   parameters. This happens because `$*` is a string list of all the
   parameters, while `$@` is an array of all the parameters.
   
   Anyway, the most useful construct seem to be `"$@"` because it
   preserves the original list of the parameters, and this is what we
   want in most of the cases.
