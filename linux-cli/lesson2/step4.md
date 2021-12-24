# Keyboard tricks

In the previous section we saw that we can search the command history
and recall one of the previous commands by pressing "Ctrl-r". We can
also use the _up-arrow_ and _down-arrow_ to select one of the previous
commands, and _left-arrow_ and _right-arrow_ to move the cursor while
editing a command.

Some other key combinations that can be useful use while editing
commands are:

- "Ctrl-a" -- Move cursor to the beginning of the line.
- "Ctrl-e" -- Move cursor to the end of the line.
- "Alt-f" -- Move cursor forward one word.
- "Alt-b" -- Move cursor backward one word.

- "Ctrl-l" -- Clear the screen and move the cursor to the top. Same as
  the `clear` command.

- "Ctrl-k" -- Kill (cut) text from the cursor location to the end of
  the line.
- "Ctrl-u" -- Cut text from the cursor location to the beginning of
  the line.
- "Ctrl-d" -- Delete the character at the cursor location.
- "Alt-d" -- Cut text from the cursor location to the end of the
  current word.
- "Ctrl-y" -- Yank (paste) text from the kill-ring and insert it at
  the cursor location.
	 
Write a command and try to use some of these key combinations.

The shell can also help us with _completion_, if we press the TAB key
while typing a command. For example try:
   
- `ls /etc`{{execute}}
   
- Now type `ls /etc/n` (without pressing Enter) and press TAB. Press TAB a
  second time. The shell shows us possible completions of the command
  that we are typing.
  
- Continue to add additional letters, and pressing TAB (maybe twice or
  more) after each letter. When the completion is unique, press Enter.
