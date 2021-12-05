# Ownership and permissions

In the Unix security model, a user may _own_ files and
directories. When a user owns a file or a directory, he has control
over its access (he decides who can access it). To facilitate granting
permissions, users may belong to one or more groups. If the owner of a
file grants permissions to a group, then all the members of the group
have access to this file. Besides granting access to a group, an owner
may grant some access rights to everybody, which in Unix terms is
referred to as _others_.

1. First let's create a new user:

   `useradd --help`{{execute}}

   `useradd -m -s /bin/bash user1`{{execute}}
   
   `ls /home/`{{execute}}
   
   `ls -al /home/user1/`{{execute}}
   
   The option `-m` tells it to create a home directory for the user,
   which is by default located at `/home/`, and the option `-s` tells
   it what shell to use for this user.
   
   We should also set a password for `user1`:
   
   `passwd user1`{{execute}}
   
2. Let's switch to this user and try some commands:

   `su -l user1`{{execute}}
   
   `pwd`{{execute}}
   
   `whoami`{{execute}}
   
   `id`{{execute}}
   
   When a user account is created, the system assigns it a number
   called _user ID_ or _uid_, which is mapped to a username for the
   sake of humans. Each user is also assigned a primary group ID (or
   _gid_) and may belong to additional groups.
   
3. User accounts are defined in `/etc/passwd` and groups in
   `/etc/group`. However the passwords of the users are stored in
   `/etc/shadow`:
   
   `ls -l /etc/passwd`{{execute}}
   
   `file /etc/passwd`{{execute}}
   
   `less /etc/passwd`{{execute}}
   
   You can see that besides the normal users there are also some
   system users, including the superuser (or _root_), with uid=0.
   
   `ls -l /etc/group`{{execute}}
   
   `file /etc/group`{{execute}}
   
   `less /etc/group`{{execute}}
   
   `ls -l /etc/shadow`{{execute}}
   
   `file /etc/shadow`{{execute}}
   
   `less /etc/shadow`{{execute}}
   
   You don't have permission to see the content of this file.

3. When you use the command `ls -l`, the first column of the output
   (the one which has some dashes) shows the _attributes_ of the file.
   
   `> foo.txt`{{execute}}
   
   `ls -l foo.txt`{{execute}}
   
   The first char of attributes shows the file type. If this char is a
   `-` it is a regular file, `d` is for a directory, `l` for a
   symbolic link, `c` for a _character special file_ (for example a
   keyboard or network card), and `d` for _block special file_ (like a
   hard drive or RAM).
   
   The remaining 9 characters show the access rights for the file's
   owner, the file's group, and the rest of the users. They are `rwx`
   for the user, `rwx` for the group, and `rwx` for the others, where
   `r` stands for _reading_ (viewing the content of the file), `w` is
   for _writing_ (modifying the content of the file), and `x` is for
   _executing_ (running the file like a program or a script). If there
   is a minus (or a dash) instead of `r`, `w` or `x`, it means that
   the corresponding right is missing.
   
   For a directory, the `x` attribute allows a directory to be entered
   (e.g. `cd directory`). The `r` attribute allows a directory's
   content to be listed (with `ls`), but only if the `x` attribute is
   also set. And the `w` attribute allows files within a directory to
   be created, deleted, and renamed, if the `x` attribute is also set.

4. We can change the permissions of a file or directory with `chmod`.
   Only the owner and the superuser can change the permissions of a file
   or directory.
   
   `ls -l foo.txt`{{execute}}
   
   `chmod 600 foo.txt`{{execute}}
   
   `ls -l foo.txt`{{execute}}
   
   In this case we are using _octal_ notation for telling `chmod` what
   permissions to set. For example **7** (`111`) is for `rwx`, **6**
   (`110`) is for `rw-`, **5** (`101`) is for `r-x`, **4** (`100`) is
   for `r--`, and **0** is for `---` (no permissions).
   
   We can also use _symbolic_ notation with `chmod`, where **u**
   (user) represents the owner, **g** represents the group, and **o**
   (others) represents the world. There is also the symbol **a** (all)
   which is a combination of **u**, **g** and **o**.
   
   - Add the _execute_ permission to the user:
   
     `chmod u+x foo.txt`{{execute}}
    
     `ls -l foo.txt`{{execute}}

   - Remove the _execute_ permission from the user:
   
     `chmod u-x foo.txt`{{execute}}
    
     `ls -l foo.txt`{{execute}}

   - Add _execute_ to user, group and others should have only _read_
     and _execute_:
	 
     `chmod u+x,go=rx foo.txt`{{execute}}
    
     `ls -l foo.txt`{{execute}}

   - Remove the _execute_ permission from all:
   
     `chmod ugo-x foo.txt`{{execute}}
    
     `chmod a-x foo.txt`{{execute}}
    
     `chmod -x foo.txt`{{execute}}
    
     `ls -l foo.txt`{{execute}}

5. The `umask` command controls the default permissions given to a
   file when it is ceated:

   `umask`{{execute}}
   
   This octal notation tells which bits will be _masked_ (removed)
   from the attributes of a file:
   
   `rm -f foo.txt`{{execute}}
   
   `> foo.txt`{{execute}}
   
   `ls -l foo.txt`{{execute}}
   
   Th reason that the others don't have a `w` permission is because of
   the mask. Remember that the number **2** in octal is written as
   `010`, so the permissions expressed by it are `-w-`. This means
   that the `w` permission for the others will be removed from the
   attributes.
   
   Let's change the mask and try again:
   
   `rm foo.txt`{{execute}}
   
   `umask 0000`{{execute}}
   
   `> foo.txt`{{execute}}
   
   `ls -l foo.txt`{{execute}}

   Restore the normal umask:
   
   `umask 0002`{{execute}}
   
6. The command `chown` can be used to change the owner and/or the
   group of a file. Let's try it:
   
   `chown root: foo.txt`{{execute}}
   
   `whoami`{{execute}}
   
   Superuser priviledes are required to use it. Let's exit from the
   shell of `user1` and try again as user `root`:

   `exit`{{execute}}
   
   `whoami`{{execute}}
   
   `chown root: foo.txt`{{execute}}

   `ls -l foo.txt`{{execute}}
   
   `chown user1:root foo.txt`{{execute}}
   
   `ls -l foo.txt`{{execute}}
