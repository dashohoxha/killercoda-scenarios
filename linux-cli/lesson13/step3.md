# String operations

1. Length of the string: `${#parameter}`

   `foo="This string is long."`{{execute}}
   
   `echo "'$foo' is ${#foo} characters long."`{{execute}}
   
   However, `${#@}` and `${#*}` give the number of the positional
   parameters.

2. Extract a substring: <br/>
   `${parameter:offset}`<br/>
   `${parameter:offset:length}`
   
   `echo ${foo:5}`{{execute}}
   
   `echo ${foo:5:6}`{{execute}}
   
   `${foo: -5}`{{execute}}
   
   `${foo: -5:2}`{{execute}}
   
   Notice that a space is needed before the `-` in order to avoid
   confusion with a default value.
   
3. Remove text from the beginning and from the end:<br/>
   `${parameter#pattern}`<br/>
   `${parameter##pattern}`<br/>
   `${parameter%pattern}`<br/>
   `${parameter%%pattern}`

   `foo=file.txt.zip`{{execute}}
   
   `echo ${foo#*.}`{{execute}}
   
   `echo ${foo##*.}`{{execute}}
   
   `echo ${foo%.*}`{{execute}}
   
   `echo ${foo%%.*}`{{execute}}

4. Replace:<br/>
   `${parameter/pattern/string}`<br/>
   `${parameter//pattern/string}`<br/>
   `${parameter/#pattern/string}`<br/>
   `${parameter/%pattern/string}`
   
   `foo=XYZ.XYZ.XYZ`{{execute}}
   
   `echo ${foo/XYZ/xyz}`{{execute}}
   
   `echo ${foo//XYZ/xyz}`{{execute}}
   
   `echo ${foo/%XYZ/xyz}`{{execute}}
   
   `echo ${foo/#XYZ/xyz}`{{execute}}
   
   If the replacement is omitted, then the matched pattern will be
   deleted.
   
   `echo ${foo/XYZ}`{{execute}}
   
   `echo ${foo//XYZ}`{{execute}}
   
   `echo ${foo/%XYZ}`{{execute}}
   
   `echo ${foo/#XYZ}`{{execute}}
   
5. Let's modify the previous `longest-word` example to use `${#j}`
   instead of `$(echo -n "$j" | wc -c)` for getting the length of a
   word:
   
   `diff -u longest-word3.sh longest-word2.sh`{{execute}}
   
   `vim longest-word3.sh`{{execute}}
   
   `ls -l /usr/bin > dirlist-usr-bin.txt`{{execute}}
   
   `./longest-word3.sh dirlist-usr-bin.txt`{{execute}}
   
   It is not only simpler, but also more efficient:

   `time ./longest-word3.sh dirlist-usr-bin.tx`{{execute}}
   
   `time ./longest-word2.sh dirlist-usr-bin.tx`{{execute}}

6. Case conversion:

   `foo=ABCD`{{execute}}
   
   `echo ${foo,}`{{execute}}
   
   `echo ${foo,,}`{{execute}}
   
   `foo=abcd`{{execute}}
   
   `echo ${foo^}`{{execute}}
   
   `echo ${foo^^}`{{execute}}
   
   We can also declare a variable to keep only uppercase or lowercase
   content:
   
   `declare -u foo`{{execute}}
   
   `foo=aBcD`{{execute}}
   
   `echo $foo`{{execute}}

   `declare -l foo`{{execute}}
   
   `foo=aBcD`{{execute}}
   
   `echo $foo`{{execute}}

   `unset foo`{{execute}}
   
   `foo=aBcD`{{execute}}
   
   `echo $foo`{{execute}}
