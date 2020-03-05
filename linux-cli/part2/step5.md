# Shell quotes

1. Using quotes in a command affects the spaces:

   `echo this is a      test`{{execute}}
   
   `echo "this is a      test"`{{execute}}
   
   When the shell parses the first command it find 4 arguments:
   "this", "is", "a", "test". Then is calls `echo` passing it these
   arguments.
   
   In the second case the quotes let the shell know that this is a
   single argument: "this is a test", and it passes to `echo` only
   this argument.

2. Double quotes do not prevent variable expansion, but single quotes
   do:
   
   `echo The total is $100.0`{{execute}}
   
   `echo "The total is $100.0"`{{execute}}
   
   `echo 'The total is $100.0'`{{execute}}
   
   Bash reckognizes `$1` as a special variable and tries to replace
   its value (which is empty). Using double quotes does not prevent
   Bash from expanding variables, we need single quotes for that.
   
3. Double quotes do not prevent the shell expansions that start with a
   "`$`", but prevents the others:
   
   `echo ~/*.txt {a,b} $(echo foo) $((2 + 2))`{{execute}}

   `echo "~/*.txt {a,b} $(echo foo) $((2 + 2))"`{{execute}}

   `echo '~/*.txt {a,b} $(echo foo) $((2 + 2))'`{{execute}}

   They are useful for preserving the spaces, for example:
   
   `echo $(cal)`{{execute}}
   
   `echo "$(cal)"`{{execute}}
   
4. We can also escape "`$`" by preceding it with "`\`":

   `echo The balance is: $5.00`{{execute}}
  
   `echo The balance is: \$5.00`{{execute}}
  
5. The option `-e` of `echo` will also enable other escape sequences
   like `\n` (for a new line) and `\t` (for a tab):
   
   `echo "a\nb"`{{execute}}
   
   `echo -e "a\nb"`{{execute}}
   
   `echo "a\tb"`{{execute}}
   
   `echo -e "a\tb"`{{execute}}
