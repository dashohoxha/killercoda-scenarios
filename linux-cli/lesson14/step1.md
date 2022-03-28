# Arrays

Arrays are variables that hold more than one value at a time.

1. Getting started:

   `a[0]=foo`{{execute}}
   
   `echo ${a[0]}`{{execute}}
   
   `days=(Sun Mon Tue Wed Thu Fri Sat)`{{execute}}

   `echo ${days[0]}`{{execute}}

   `echo ${days[*]}`{{execute}}

   `echo $days[*]`{{execute}}

   `echo $days`{{execute}}

   If no index is given, the first item is returned.
   
   `days=([0]=Sun [1]=Mon [2]=Tue [3]=Wed [4]=Thu [5]=Fri [6]=Sat)`{{execute}}

   `echo ${days[*]}`{{execute}}

2. Let's see an example that counts files by modification time and
   shows them in a table. Such a script could be used to determine
   when a system is most active.

   `./hours.sh`{{execute}}
   
   `./hours.sh /usr/bin/`{{execute}}
   
   `vim hours.sh`{{execute}}
   
   To get the last modification time of the files we use the command
   `stat`:
   
   `stat --help | less`{{execute}}
   
   `stat -c %y *`{{execute}}
   
   `stat -c %y * | cut -c 12-13`{{execute}}
   
   We use the hour of modification as an index for the array.
   
3. Outputting the entire contents of an array:

   `animals=("a dog" "a cat" "a fish")`{{execute}}
   
   `for i in ${animals[*]}; do echo $i; done`{{execute}}
   
   `for i in ${animals[@]}; do echo $i; done`{{execute}}

   `for i in "${animals[*]}"; do echo $i; done`{{execute}}
   
   `for i in "${animals[@]}"; do echo $i; done`{{execute}}
   
   Notice that this is similar to the behavior of the array of the
   positional parameters: `$*`, `$@`, `"$*"`, `"$@"`.

4. The number of array elements:

   `a[100]=foo`{{execute}}
   
   `echo ${#a[@]}`{{execute}}
   
   There is only one element in the array.
   
   `echo ${#a[100]}`{{execute}}
   
   This is the length of the element 100.
   
   Remember that `$#` is the number of positional parameters.
   
5. Finding the subscripts used by an array:

   `foo=([2]=a [4]=b [6]=c)`{{execute}}
   
   `for i in "${foo[@]}"; do echo $i; done`{{execute}}
   
   `for i in "${!foo[@]}"; do echo $i; done`{{execute}}

6. Adding elements to the end of an array:

   `foo=(a b c)`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   `foo+=(d e f)`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
7. It is not so hard to sort an array with a little bit of coding:

   `vim array-sort.sh`{{execute}}
   
   `./array-sort.sh`{{execute}}
   
8. To delete an array, use the `unset` command:

   `foo=(a b c d e f)`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   `unset foo`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   It may also be used to delete single array elements.
      
   `foo=(a b c d e f)`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   `unset 'foo[2]'`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   Notice that the array element must be quoted to prevent the shell
   from performing pathname expansion.
   
9. Notice also that the assignment of an empty value to an array does
   not empty its contents:
   
   `foo=(a b c d e f)`{{execute}}
   
   `foo=`{{execute}}

   `echo ${foo[@]}`{{execute}}
   
   This is because any reference to an array variable without a
   subscript refers to element zero of the array. For example:
   
   `foo=(a b c d e f)`{{execute}}
   
   `echo ${foo[@]}`{{execute}}
   
   `foo=A`{{execute}}

   `echo ${foo[@]}`{{execute}}
   
10. Associative arrays use strings rather than integers as array
    indexes:
	
	```
	declare -A colors
    colors["red"]="#ff0000"
    colors["green"]="#00ff00"
    colors["blue"]="#0000ff"
	```{{execute}}
	
	Associative arrays must be created with `declare -A`.  Its
	elements are accessed in the same way as the integer indexed
	arrays:

   `echo ${colors["green"]}`{{execute}}
