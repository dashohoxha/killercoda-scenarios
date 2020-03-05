# Redirecting standard input

A command that makes use of standard input is `cat` (which is a
shortening for concatenate). It usually takes one or more files as
arguments and outputs their contents to the screen, joined together.

`cat ls-output.txt ls-error.txt`{{exeute}}

However if no files are given as arguments it just reads lines from
the standard input (keyboard by default) and writes them to the
standard output (screen by default). Let's try it:

`cat`{{execute}}

Type a couple of lines and thes press "Ctrl-d" to tell `cat` that it
has reached the _end of file_ (EOF) on standard input.

If we redirect the standard output to a file, then it can be used to
create short files. For example try these:

`cat > lazy_dog.txt`{{execute}}

`The quick brown fox jumped over the lazy dog.`{{execute}}

Press "Ctrl-d" at the end.

`cat lazy_dog.txt`{{execute}}

To redirect the _standard input_ (**stdin**) we can use the
redirection operator "`<`", like this:

`cat < lazy_dog.txt`{{execute}}

We have changed the source of standard input from the keyboard to the
file `lazy_dog.txt`.
