# Navigation

The command `cd` (change directory) is used to move from one directory
to another. The command `pwd` (print working directory) shows the
current location. The command `ls` (list) shows the content of the
current working directory.

1. Display the current working directory with `pwd` (print working
   directory):
   
   `pwd`{{execute}}
   
2. List the contents of a directory:

   `ls /`{{execute}}
   
   `ls /usr`{{execute}}
   
   `ls -l /usr`{{execute}}
   
3. Change the current working directory:

   `cd /usr`{{execute}}
   
   `pwd`{{execute}}
   
   `ls`{{execute}}
   
   `cd /usr/bin`{{execute}}
   
   `pwd`{{execute}}
   
   The path `/usr/bin` is called _absolute_, since it shows the full
   path, starting from the _root_ (`/`).
   
4. Go to the directory one level up:

   `cd ..`{{execute}}
   
   `pwd`{{execute}}
   
   Two dots (`..`) represent the _parent_ of the current directory.
   
   By the way, a single dot (`.`) represents the current directory:
   
   `cd .`{{execute}}
   
   `pwd`{{execute}}
   
5. Use a relative path:

   `cd bin`{{execute}}
   
   `pwd`{{execute}}
   
   The directory `bin` is relative to the current one (in this case
   `/usr`).
   
6. Go to the previous current directory:

   `cd /var/log`{{execute}}
   
   `cd -`{{execute}}
   
   `cd -`{{execute}}
   
7. Go to the home directory:

   `cd`{{execute}}
   
   `cd ~`{{execute}}
   
   The tilde (`~`) represents the home directory of the current user.
   
