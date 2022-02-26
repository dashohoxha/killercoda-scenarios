# Vim

1. Starting and quitting.

   `vim`{{execute}}
   
   The tilde char (`~`) at the start of a line means that there is no
   text on that line.
   
   To quit press `:q`{{execute}}
   
2. Editing modes.

   Let's start it again, passing to it the name of a nonexistent file:

   `rm -f foo.txt`{{execute}}
   
   `vim foo.txt`{{execute}}
   
   Vim has a _command mode_ and an _insert mode_. In the _command
   mode_ the keys that we type are interpreted as commands. In the
   _insert mode_ we can add text to the file.
   
   When it starts up, Vim is in the _command mode_. To switch the mode
   to _insert_ let's give the command:
   
   `i`{{execute no-newline}}
   
   Notice the status `-- INSERT --` at the bottom.
   
   Now let's enter some text:
   
   `The quick brown fox jumped over the lazy dog.`{{execute no-newline}}
   
   To exit the _insert_ mode and return to _command_ mode, press ESC
   (`^ESC`{{execute ctrl-seq}}).
   
   To save the file type:
   
   `:w`{{execute}}
   
3. Moving the cursor around.

   While in the command mode, we can move with the keys:
   
   - `h`{{execute no-newline}} -- left
   - `l`{{execute no-newline}} -- right
   - `j`{{execute no-newline}} -- down
   - `k`{{execute no-newline}} -- up

   Press a few times `h`{{execute no-newline}} and `l`{{execute no-newline}}.
   
   We can also use:
   - `0`{{execute no-newline}} -- to the beginning of line
   - `$`{{execute no-newline}} -- to the end of line
   - `w`{{execute no-newline}} -- to the beginning of next word or punctuation char
   - `W`{{execute no-newline}} -- to the beginning of next word (ignore punctuations)
   - `b`{{execute no-newline}} -- backwards one word or punctuation char
   - `B`{{execute no-newline}} -- backwards one word (ignore punctuations)
   
   Try them a few times.
   
   If a command is prefixed by a number, it will be repeated that many
   times. For example `3w`{{execute no-newline}} is the same as
   pressing `w`{{execute no-newline}} 3 times.
   
   We can also use the arrows (left, right, up, down).
   
4. Basic editing.

   With the command `i` we start inserting text at the current
   position of the cursor. To append text after the current position
   we can use the command `a`. To start appending text at the end of
   the line, we use the command:
   
   `A`{{execute no-newline}}
   
   Now type:
   
   ```
    It was cool.
   Line 2
   Line 3
   Line 4
   Line 5
   ```{{execute}}
   
   Then press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to
   command mode, then `:w`{{execute}} to save (write to file).
   
   - Go to the first line: `1G`{{execute no-newline}}
   - Go to the last line: `G`{{execute no-newline}}
   - Go to the third line: `3G`{{execute no-newline}}
   
   Then:
   
   - Open a new line below the current one: `o`{{execute no-newline}}
   - Undo: `^ESC`{{execute ctrl-seq}} and `u`{{execute no-newline}}
   - Open a new line above the current one: `O`{{execute no-newline}}
   - Undo: `^ESC`{{execute ctrl-seq}} and `u`{{execute no-newline}}

5. Deleting text.

6. Cut, copy and paste.

7. Search and replace.

