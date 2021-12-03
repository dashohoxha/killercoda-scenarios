Commands and programs in Linux usually produce some output. This
output is of two types:

1. The program's results, that is the data that the program is
   designed to produce
2. Status and error messages, which tell how the program is getting
   along.
   
Programs usually output the results to the _standard output_ (or
**stdout**) and the status messages to the _standard error_
(**stderr**). By default, both _stdout_ and _stderr_ are linked to the
screen (computer display).

In addition, many programs take input from a facility called _standard
input_ (**stdin**), which is by default attached to the keyboard.

I/O redirection allows us to change where output goes and where input
comes from. Normally, output goes to the screen and input comes from
the keyboard, but with I/O redirection we can change that.

We can also chain several commands together in a pipeline, where the
output of a command is sent as the input of another. This is a
powerful feature that allows us to perform complex operations on data
by combining simple utilities.
