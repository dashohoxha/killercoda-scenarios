# Variables and constants

1. Variables in bash don't have to be declared, we just use them:

   `foo="yes"`{{execute}}
   
   `echo $foo`{{execute}}
   
   We have a shell expansion here, and it is the same as: `echo yes`
   
   `echo $foo1`{{execute}}
   
   It is the first time that the shell sees the variable `foo1`,
   however it does not complain but just creates it and gives it an
   empty value. This means that we should be careful with spelling the
   names of the variables, otherwise we may get strange results.
   
   `touch foo.txt`{{execute}}
   
   `foo=foo.txt`{{execute}}
   
   `foo1=foo1.txt`{{execute}}
   
   `cp $foo $fool`{{execute}}

   We have misspelled the second argument, so shell expands it to an
   empty string and we get an error from `cp`.

2. To denote constants in bash, we use uppercase variable names, by
   convention:

   `vim sys_info.sh`{{execute}}
   
   `:% s/$title/$TITLE/g`{{execute}}

   `:% s/title=/TITLE=/`{{execute}}
   
   `:/^TITLE=/ s/Report/Report for $HOSTNAME/`{{execute}}
   
   `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}

   We have also used the environment variable `HOSTNAME`. Environment
   variables are considered as constants, so they are in uppercase.
   
   Actually, there is a way to make sure that a variable cannot be
   changed (is a constant), although it is not used frequently:
   
   `sed -i sys_info.sh -e 's/TITLE=/declare -r TITLE='`{{execute}}
   
   `cat sys_info.sh`{{execute}}
   
   `./sys_info.sh`{{execute}}

   The option `-r` of `declare` means "read-only". So, we cannot
   assign a value again to this variable.

3. When a value is assigned to a variable there should be no spaces
   around the equal sign:
   
   `a=z`{{execute}}
   
   `echo $a`{{execute}}
   
   Shell expansions are applied to the value, before assignment:
   
   `b="a string"`{{execute}}
   
   `c="a string and $b"`{{execute}}
   
   `echo $c`{{execute}}
   
   `d=$(ls -l foo.txt)`{{execute}}
   
   `echo $d`{{execute}}
   
   `e=$((5 * 7))`{{execute}}
   
   `echo $e`{{execute}}
   
   `f="\t\ta string\n"`{{execute}}

   `echo $f`{{execute}}
   
   `echo -e $f`{{execute}}
   
   `help echo`{{execute}}
   
   Multiple assignments may be done on a single line:
   
   `a=5 b="a string"`{{execute}}

4. During expansion, variable names may be surrounded by curly braces
   `{}`, which are necessary in some cases. For example:
   
   `filename="myfile"`{{execute}}
   
   `touch $filename`{{execute}}
   
   `mv $filename $filename1`{{execute}}
   
   What we want is to rename the file to `myfile1`, but the shell is
   interpreting `filename1` as a variable, which of course has not
   been assigned yet and is empty. We should do it like this
   
   `mv $filename ${filename}1`{{execute}}

5. Let's add a timestamp to the report, using variables/constants:

   `date +"%x %r %Z"`{{execute}}
   
   `echo $USER`{{execute}}

   `vim sys_info.sh`{{execute}}
   
   `/TITLE=`{{execute}}
   
   `o`{{execute no-newline}}
   
   ```
   CURRENT_TIME=$(date +"%x %r %Z")
   TIMESTAMP="Generated on $CURRENT_TIME, by $USER"
   ```{{execute no-newline}}
   
   `^ESC`{{execute ctrl-seq}} and `:w`{{execute}}
   
   `/<h1>`{{execute}}

   `Yp`{{execute no-newline}}
   
   `:s/h1/p/g`{{execute}}

   `:s/TITLE/TIMESTAMP/`{{execute}}

   `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}
