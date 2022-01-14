# Shell expansions
   
Each time we type a command and press the enter key, `bash` performs
several processes upon the text before it carries out the command.
This process is called `expansion`.

1. Wildcard expanssions:

   `echo this is a test`{{execute}}
   
   `echo` displays all the arguments that are passed to it.
   
   `cd /usr`{{execute}}
   
   `ls`{{execute}}
   
   `echo *`{{execute}}

   The "`*`" character means match any characters in a filename.  The
   shell expands the "`*`" before executing the command `echo`.

   `echo lib*`{{execute}}
   
   `echo *bin`{{execute}}
   
   `echo lib*32`{{execute}}
   
   `echo */share`{{execute}}
   
   `echo /*/*/bin`{{execute}}
   
   A question mark "`?`" matches any single character:
   
   `echo lib??`{{execute}}
   
   `echo lib???`{{execute}}
   
   Character sets are enclosed in square brackets:
   
   `echo lib[123456789]?`{{execute}}

   `echo lib[xyz][123456789]?`{{execute}}
   
   Character ranges:
   
   `echo lib[1-9][1-9]`{{execute}}

   `echo lib[a-z][1-9][1-9]`{{execute}}

   `echo lib[1-9][!2]`{{execute}}
   
   Character classes:

   `echo lib[[:digit:]][[:digit:]]`{{execute}}

   `echo lib[[:alpha:]][[:digit:]][[:digit:]]`{{execute}}

   `echo lib[[:alnum:]][[:alnum:]][[:alnum:]]`{{execute}}

   `echo lib[![:digit:]]*`{{execute}}
   
   `echo lib[36[:lower:]]*`{{execute}}

   `echo /etc/[[:upper:]]*`{{execute}}

2. The tilde character ("`~`") expands to the home directory:

   `echo ~`{{execute}}
   
   `echo ~root`{{execute}}
   
3. Arithmetic expansion:

   `echo $((2 + 2))`{{execute}}
   
   `echo $(($((5**2)) * 3))`{{execute}}
   
   `echo $(((5**2) * 3))`{{execute}}

   `echo Five divided by two equals $((5/2))`{{execute}}
   
   `echo with $((5%2)) left over`{{execute}}

4. Brace expansion:

   `echo Front-{A,B,C}-Back`{{execute}}
   
   `echo Number_{1..5}`{{execute}}
   
   `echo {01..15}`{{execute}}
   
   `echo {001..15}`{{execute}}
   
   `echo {Z..A}`{{execute}}
   
   `echo a{A{1,2},B{3,4}}b`{{execute}}
   
   `cd`{{execute}}
   
   `mkdir Photos`{{execute}}
   
   `cd Photos`{{execute}}
   
   `mkdir {2017..2019}-{01..12}`{{execute}}
   
   `ls`{{execute}}
   
5. Variable expansion:

   `echo $USER`{{execute}}
   
   `printenv | less`{{execute}}
   
   `echo $SUER`{{execute}}
   
   When the variable does not exist, it is expanded to the empty
   string.
   
6. Command substitution:

   `echo $(ls)`{{execute}}
   
   `ls -l $(which cp)`{{execute}}

   `echo "$(cal)"`{{execute}}
