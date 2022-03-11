# Variable expansions

1. We have already seen that sometimes we need to surround variable
   names in braces, to avoid any confusion:
   
   `a="foo"`{{execute}}
   
   `echo "$a_file"`{{execute}}
   
   `echo "${a}_file"`{{execute}}

2. Get a default value if the variable is unset (or empty):
   `${parameter:-word}`

   `foo=`{{execute}}
   
   `echo ${foo:-"substitute value if unset"}`{{execute}}
   
   `echo $foo`{{execute}}
   
   `foo=bar`{{execute}}
   
   `echo ${foo:-"substitute value if unset"}`{{execute}}
   
   `echo $foo`{{execute}}

3. Assign a default value if the variable is unset (or empty):
   `${parameter:=word}`

   `foo=`{{execute}}
   
   `echo ${foo:="default value if unset"}`{{execute}}
   
   `echo $foo`{{execute}}
   
   `foo=bar`{{execute}}
   
   `echo ${foo:="default value if unset"}`{{execute}}

   `echo $foo`{{execute}}
   
   **Note:** Positional and other special parameters cannot be
   assigned this way.

4. Exit with an error message if the parameter is unset or empty:
   `${parameter:?word}`
   
   `foo=`{{execute}}
   
   `echo ${foo:?"parameter is empty"}`{{execute}}
   
   `echo $?`{{execute}}
   
   `foo=bar`{{execute}}
   
   `echo ${foo:?"parameter is empty"}`{{execute}}
   
   `echo $?`{{execute}}
   
5. Return the given value only if the parameter is not empty:
   `${parameter:+word}`

   `foo=`{{execute}}
   
   `echo ${foo:+"substitute value if set"}`{{execute}}
   
   `foo=bar`{{execute}}
   
   `echo ${foo:+"substitute value if set"}`{{execute}}
   
6. Return the names of variables that begin with a prefix:
   `${!prefix*}` or `${!prefix@}`
   
   `echo ${!BASH*}`{{execute}}

   `echo ${!BASH@}`{{execute}}
