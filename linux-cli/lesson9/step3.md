# Editing multiple files

1. It is often useful to edit more than one file at a time.

   Quit from vim:
   
   `:q!`{{execute}}
   
   Let's create another test file:
   
   `ls -l /usr/bin > ls-output.txt`{{execute}}
   
   Start vim with both test files as argument:
   
   `vim foo.txt ls-output.txt`{{execute}}
   
   To see the list of buffers (opened files):

   `:buffers`{{execute}}
   
   To switch to the next buffer press `:bn`:
   
   `:bn`{{execute}} `:bn`{{execute}} `:bn`{{execute}}
   
   To switch to the previous buffer press `:bp`:
   
   `:bp`{{execute}} `:bp`{{execute}} `:bp`{{execute}}
   
   We can also switch to another buffer like this:
   
   `:buffer 2`{{execute}}
   
   `:buffer 1`{{execute}}

2. It's also possible to add files to the current editing session.

   `:q!`{{execute}}
   
   `vim foo.txt`{{execute}}
   
   `:e ls-output.txt`{{execute}}
   
   `:buffers`{{execute}}
   
3. While editing multiple files, it is possible to copy a portion of
   one file into another file that we are editing. This is easily done
   using the usual yank and paste commands.
   
   `:buffer 1`{{execute}}
   
   `1G`{{execute no-newline}} `yy`{{execute no-newline}}
   
   `:buffer 2`{{execute}}
   
   `1G`{{execute no-newline}} `p`{{execute no-newline}}

   `:q!`{{execute}}
   
4. It's also possible to insert an entire file into one that we are
   editing.
   
   `vim ls-output.txt`{{execute}}
   
   `3G`{{execute no-newline}}
   
   `:r foo.txt`{{execute}}
   
   `:w foo1.txt`{{execute}}
   
   We saved the buffer to the file `foo1.txt`, but we are still
   editing the first file and any further modifications will be done
   to it.
   
   `:q!`{{execute}}
