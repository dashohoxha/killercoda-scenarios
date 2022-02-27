# More Vim commands

1. Deleting text.

   To delete text in Vim we can use the commands `x`, which deletes
   the character at the cursor and `d`.
   
   `1G5w`{{execute no-newline}}
   
   Press `x`{{execute no-newline}} a few times to delete a few
   characters, then press `u`{{execute no-newline}} several times to
   undo.
   
   Press `3x`{{execute no-newline}} to delete 3 chars, then `u`{{execute no-newline}} to undo.
   
   Try also these and see what they do:
   
   - `dW`{{execute no-newline}} and `u`{{execute no-newline}}
   - `5dW`{{execute no-newline}} and `u`{{execute no-newline}}
   - `d$`{{execute no-newline}} and `u`{{execute no-newline}}
   - `d0`{{execute no-newline}} and `u`{{execute no-newline}}
   - `dd`{{execute no-newline}} and `u`{{execute no-newline}}
   - `3dd`{{execute no-newline}} and `u`{{execute no-newline}}
   - `dG`{{execute no-newline}} and `u`{{execute no-newline}}
   - `d4G`{{execute no-newline}} and `u`{{execute no-newline}}

2. Cut, copy and paste.

   When we delete some text, it is actually like _cut_, because the
   deleted part is placed on a _paste_ buffer and can be placed
   somewhere else. To paste it after the cursor we can use the command
   `p`, to paste it before the cursor we can use capital `P`. Try:
   
   `5x`{{execute no-newline}} `p`{{execute no-newline}} `uu`{{execute no-newline}}

   `3x`{{execute no-newline}} `P`{{execute no-newline}} `uu`{{execute no-newline}}

   `5dw`{{execute no-newline}} `$`{{execute no-newline}} `p`{{execute no-newline}} `uu`{{execute no-newline}}

   `d$`{{execute no-newline}} `0`{{execute no-newline}} `p`{{execute no-newline}} `u`{{execute no-newline}} `P`{{execute no-newline}} `uu`{{execute no-newline}}
   
   `dd`{{execute no-newline}} `p`{{execute no-newline}} `u`{{execute no-newline}} `P`{{execute no-newline}} `uu`{{execute no-newline}}
   
   Instead of `d` we can use the command `y` (yank) to copy text.
   
   `yw`{{execute no-newline}} `p`{{execute no-newline}} `u`{{execute no-newline}} `P`{{execute no-newline}} `u`{{execute no-newline}}
   
   `5yw`{{execute no-newline}} `P`{{execute no-newline}} `u`{{execute no-newline}}

   `yy`{{execute no-newline}} `p`{{execute no-newline}} `u`{{execute no-newline}}
   
   `3yy`{{execute no-newline}} `P`{{execute no-newline}} `u`{{execute no-newline}} `p`{{execute no-newline}} `u`{{execute no-newline}}
   
   `yG`{{execute no-newline}} `P`{{execute no-newline}} `u`{{execute no-newline}}

   `y$`{{execute no-newline}} `0`{{execute no-newline}} `P`{{execute no-newline}} `u`{{execute no-newline}}

   To join a line with the next one we can use `J`:
   
   `3G`{{execute no-newline}} `J`{{execute no-newline}} `J`{{execute no-newline}} `uu`{{execute no-newline}}

3. Search and replace.

   To find a character in the current line, press `f` and the character:
   
   `1G`{{execute no-newline}} `fa`{{execute no-newline}} `;`{{execute no-newline}}

   To move the cursor to the next occurrence of a word or phrase, the
   `/` command is used. Type a word or phrase after it and then Enter:

   `/`{{execute no-newline}} then `Line`{{execute}}
   
   To find the next match press `n`:
   
   `n`{{execute no-newline}} `n`{{execute no-newline}} `n`{{execute no-newline}}
   
   To replace (substitute) `Line` by `line` in the whole file use:
   
   `:% s/Line/line/g`{{execute}}

   It is similar to the `sed` command. It starts with a range of lines
   where to perform the substitution. In this example, `%` denotes the
   whole file and is the same as `1,$` (from the first line to the
   last one).
   
   We can also ask for confirmation by adding the modifier `c` at the
   end:
   
   `:1,$ s/line/Line/gc`{{execute}}

   The options are:
   
   - `y` -- yes
   - `n` -- no
   - `a` -- all
   - `q` -- quit
   - `l` -- last (replace this one and quit)
   - `Ctrl-e` / `Ctrl-y` -- scroll down and up, to see the context
