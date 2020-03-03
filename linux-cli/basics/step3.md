# Command options

Let's see some options of the command `ls`.

1. List only some file:

   `ls /bin`{{execute}}

   `ls /bin/b* /bin/c*`{{execute}}

   We are listing only those files that start with `b` and those that
   start with `c`, on the directory `/bin`.

2. Long listing:

   `ls -l /bin/b* /bin/c*`{{execute}}

   The option `-l` stands for _long_ listing, where each file is
   printed on its own line, with more details.

3. Long and short options.

   Notice that the middle command shows the size of the file (in
   bytes). To make the size more readable we can use the option
   `--human-readable`:

   `ls -l --human-readable /bin/b* /bin/c*`{{execute}}

   Instead of this long option we can its short equivalent `-h`, which
   is more convenient to write:

   `ls -l -h /bin/b* /bin/c*`{{execute}}
   
   **Tip:** In order to modify a previous command, you can use the
   _up-arrow_ key on the keyboard to display the previous command, use
   left-arrow and right-arrow keys to locate the cursor, modify the
   command, and then press [Enter].

4. Merging short options.

   We can also merge the short options like this:

   `ls -lh /bin/b* /bin/c*`{{execute}}

   By default files are listed alphabetically, but we can sort them
   by modification time, using the option `-t`:

   `ls -lht /bin/b* /bin/c*`{{execute}}

5. With the option `--reverse` or `-r` we can reverse the order of
   display:

   `ls -lt --reverse /bin/b* /bin/c*`{{execute}}

   `ls -lh --reverse /bin/b* /bin/c*`{{execute}}

   `ls -ltr /bin/b* /bin/c*`{{execute}}

   `ls -lhr /bin/b* /bin/c*`{{execute}}

Usually the options have a long version (like `--reverse` or
`--human-readable`) and a short one (like `-r` or `-h`). But not
all of them. For example the options `-l` or `-t` don't have a long
version.

It seems like the short options are more convenient when
writing commands, why do you think the long options might be
useful?
