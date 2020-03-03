# Manipulating files and directories

To work with files and directories we can use these commands:
- `cp` - Copy files and directories
- `mv` - Move/rename files and directories
- `mkdir` - Create directories
- `rm` - Remove files and directories
- `ln` - Create hard and symbolic links

Let's use them in some examples.

1. Creating directories:

   `cd`{{execute}}
   
   `mkdir playground`{{execute}}
   
   `cd playground`{{execute}}
   
   `mkdir dir1 dir2`{{execute}}
   
   `ls -l`{{execute}}
   
2. Copying files:

   `cp /etc/passwd .`{{execute}}
   
   `ls -l`{{execute}}
   
   Notice that `.` is the current working directory.
   
   `cp -v /etc/passwd .`{{execute}}
   
   The option `-v` makes the command verbose.

   `cp -i /etc/passwd .`{{execute}}
   
   The option `-i` makes the command _interactive_. This means that it
   asks you first, before doing any potentially destructive actions.
   Press `y`{{execute}} or `n`{{execute}} to continue.

3. Moving and renaming files:

   `mv passwd fun`{{execute}}
   
   `ls -l`{{execute}}
   
   `mv fun dir1`{{execute}}
   
   `ls -l`{{execute}}
   
   `ls -l dir1`{{execute}}
   
   `mv dir1/fun dir2`{{execute}}
   
   `ls -l dir1`{{execute}}
   
   `ls -l dir2`{{execute}}
   
   `mv dir2/fun .`{{execute}}
   
   `ls -lR`{{execute}}
   
   `mv fun dir1`{{execute}}
   
   `mv dir1 dir2`{{execute}}
   
   `ls -lR`{{execute}}
   
   `ls -l dir2/dir1`{{execute}}
   
   `mv dir2/dir1 .`{{execute}}
   
   `mv dir1/fun .`{{execute}}
   
   `ls -lR`{{execute}}
   
4. Creating hard links:

   `ln fun fun-hard`{{execute}}
   
   `ln fun dir1/fun-hard`{{execute}}
   
   `ln fun dir2/fun-hard`{{execute}}
   
   `ls -lR`{{execute}}
   
   Notice that the second field in the listing of `fun` and `fun-hard`
   is `4`, which shows the number of the links for the file. Hard
   links are like different names for the same file content.
   
   To make sure that all four of them are the same file, let's try the
   option `-i`:

   `ls -lRi`{{execute}}
   
   You may notice that the number on the first column is the same for
   all the files. This is called the _inode_ number of a file, and can
   be thought as the address where the file is located. Since it is
   the same for all the files, this shows that they are actually the
   same file.

5. Creating symbolic links:

   `ln -s fun fun-sym`{{execute}}
   
   `ls -l`{{execute}}
   
   Symbolic links are a special type of file that contains a text
   pointer to the target file or directory. They were created to
   overcome two disadvantages of hard links:
   1. hard links cannot span physical devices
   2. hard links cannot reference directories, only files
   
   `ln -s ../fun dir1/fun-sym`{{execute}}
   
   `ln -s ../fun dir2/fun-sym`{{execute}}
   
   `ls -lR`{{execute}}
   
   These two examples might seem a bit difficult to understand what is
   going on. But remember that when we create a symbolic link, we are
   creating a text description of where the target file is, relative
   to the symbolic link.
   
   We can also use absolute file names when creating symbolic links:
   
   `ln -sf /root/playground/fun dir1/fun-sym`{{execute}}
   
   `ls -l dir1/`{{execute}}
   
   However, in most cases, using relative pathnames is more desirable,
   because it allows a directory tree containing symbolic links and
   their referenced files to be renamed and/or moved without breaking
   the links.
   
   In addition to regular files, symbolic links can also reference
   directories:
   
   `ln -s dir1 dir1-sym`{{execute}}
   
   `ls -l`{{execute}}
   
6. Removing files and directories.

   Let's clean up the playground a little bit. First let's delete one
   of the hard links:

   `rm fun-hard`{{execute}}
   
   `ls -l`{{execute}}
   
   Notice that the link count for `fun` is reduced from 4 to 3 (as
   indicated in the second field of the directory listing).
   
   `rm -i fun`{{execute}}
   
   Press `y`{{execute}} to confirm.
   
   `ls -l`{{execute}}
   
   `less fun-sym`{{execute}}
   
   The symbolic link now is broken.
   
   `rm fun-sym dir1-sym`{{execute}}
   
   `ls -l`{{execute}}
   
   When we remove a symbolic link the target is not touched.
   
   `rm -r dir1/`{{execute}}
   
   `cd ..`{{execute}}
   
   `rm -rf playground/`{{execute}}
