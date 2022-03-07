# Looping with while and until

The syntax of the `while` command is as follows:

```
while commands; do commands; done
```

1. A simple example:

   `vim while-count.sh`{{execute}}
   
   `:q!`{{execute}}
   
   `./while-count.sh`{{execute}}

2. We can use a `while` loop to improve the menu program from the
   previous step:
   
   `vim while-menu.sh`{{execute}}
   
   By enclosing the menu in a while loop, we are able to have the
   program repeat the menu display after each selection. The loop
   continues as long as `REPLY` is not equal to `0` and the menu is
   displayed again, giving the user the opportunity to make another
   selection. At the end of each action, a `sleep` command is executed
   so the program will pause for a few seconds to allow the results of
   the selection to be seen before the screen is cleared and the menu
   is redisplayed. Once `REPLY` is equal to `0`, indicating the “quit”
   selection, the loop terminates and execution continues with the
   line following `done`.
   
   `:q!`{{execute}}
   
   `./while-menu.sh`{{execute}}

3. Inside a loop in bash we can use `break` and `continue`.

   `vim while-menu2.sh`{{execute}}

   `:q!`{{execute}}
   
   `./while-menu2.sh`{{execute}}

4. The `until` loop is very similar to the `while` loop, but with a
   negated condition.

   `vim until-count.sh`{{execute}}

   `:q!`{{execute}}
   
   `./until-count.sh`{{execute}}

5. We can also read the standard input with `while` and `until`:

   `cat distros.txt`{{execute}}
   
   `vim while-read.sh`{{execute}}
   
   The `while` loop will continue as long as the `read` command is
   successful getting input from stdin, and we redirect stdin to get
   data from the file `distros.txt` (by using the operator `<` at the
   end of the `while` command).
   
   `./while-read.sh`{{execute}}

   We can also use a pipe (`|`) to redirect the stdin:

   `vim while-read2.sh`{{execute}}
   
   Notice that we are breaking long commands by adding a `\` at the
   end of a line, in order to make the program more readable and
   clear.
   
   `./while-read2.sh`{{execute}}
