# Exploring the system
   
To explore the system we use these steps:

1. Use `cd` to go to a directory.
2. List the directory contents with `ls -l`.
3. If you see an interesting file, determine its contents with the
   command `file`.
4. If it looks like it might be text, try viewing it with `less`.

Let's try some of these:

1. Go to `/bin` and list its content:

   `cd /bin`{{execute}}
   
   `ls -l`{{execute}}
   
   `ls -l b*`{{execute}}
   
   `ls -l bzless`{{execute}}

2. Check the type of some files and their contents:

   `file bzless`{{execute}}
   
   The file `bzless` is a _symbolic link_, a kind of shortcut, or
   alias, or a reference to another file. There are also _hard links_
   which we will see later.
   
   `ls -l bzmore`{{execute}}
   
   `file bzmore`{{execute}}
   
   The file `bzmore` is a shell script and actually a text file, so we
   can read its content:
   
   `less bzmore`{{execute}}
   
   Press [Space] a couple of times, and then quit with `q`.
   
   Shell scripts are like programs and contain Linux commands.
   
   The command `less` displays the contents of a **text** file
   page-by-page.
   
   **Note:** The command `less` is an improved replacement of an
   earlier Unix command that was called `more`. So, sometimes it is
   said that: `less` is `more`. Or: `less` is more or less `more`.
   
3. Let's check another file:

   `ls -lh bash`{{execute}}
   
   `file bash`{{execute}}
   
   The file `bash` is an executable program, and a **binary**
   (non-text) file. Let's try to read its content:
   
   `less bash`{{execute}}
   
   Exit with `q`.
   
   As you see, _text_ files have a content that is readable by humans,
   _non-text_ files (or _binary_ files) have a content that is not
   readable by humans (but it may be read and interpreted by some
   programs).
   
4. Let's check `/etc`:

   `file /etc`{{execute}}
   
   `ls -l /etc/passwd`{{execute}}
   
   `file /etc/passwd`{{execute}}
   
   It is plain text. Let's check its content:
   
   `less /etc/passwd`{{execute}}
   
   This file contains the accounts of the system.
   
   The files on `/etc` are usually configuration files, and almost all
   of them are text files (readable and writable by humans).
   
5. In contrast, the files on `/bin` are programs or commands and they
   are mostly binary files or shell scripts. The same goes for
   `/sbin`, `/usr/bin`, `/usr/sbin`, `/usr/local/bin`, etc.
   
   `ls /sbin`{{execute}}
   
   `ls /usr/bin`{{execute}}
   
   `ls /usr/sbin`{{execute}}
   
   `ls /usr/local/bin`{{execute}}
   
6. Some other important directories are:

   `ls /boot`{{execute}}
   
   `ls /boot/grub`{{execute}}
   
   Contains the Linux kernel, initial RAM disk image, the boot loader,
   etc.
   
   `ls /dev`{{execute}}
   
   `file /dev/console`{{execute}}
   
   `file /dev/vda`{{execute}}
   
   Contains device nodes.
   
   `ls /home`{{execute}}
   
   Contains home directories of the users.
   
   `ls /lib`{{execute}}
   
   `ls /usr/lib`{{execute}}
   
   Contains shared libraries.
   
   `ls /proc`{{execute}}
   
   `less /proc/cpuinfo`{{execute}}
   
   This is a special directory that exposes the settings and the state
   of the kernel itself.
   
   `ls /var`{{execute}}
   
   `ls /var/log`{{execute}}
   
   Contains data that are likely to change frequently (like log
   files).

   `ls /tmp`{{execute}}
   
   Temporary data which might be erased on each reboot.
