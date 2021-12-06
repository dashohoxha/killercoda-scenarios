# Example with permissions

In this example we will set up a shared directory between the users
"bill" and "karen", where they can store their music files.

1. Let's create these users first:

   `useradd -m -s /bin/bash bill`{{execute}}
   
   `ls /home/`{{execute}}

   `useradd -m -s /bin/bash karen`{{execute}}
   
   `ls /home/`{{execute}}
   
   `tail /etc/passwd`{{execute}}

2. We also need to create a group for these two users:

   `groupadd music`{{execute}}

   `tail /etc/group`{{execute}}

   `addgroup bill music`{{execute}}

   `addgroup karen music`{{execute}}

   `tail /etc/group`{{execute}}

3. Now let's create a directory:

   `mkdir -p /usr/local/share/Music`{{execute}}

   `ls -ld /usr/local/share/Music`{{execute}}

   To make this directory shareable we need to change the group
   ownership and the group permissions to allow writing:

   `chown :music /usr/local/share/Music`{{execute}}

   `chmod 775 /usr/local/share/Music`{{execute}}

   `ls -ld /usr/local/share/Music`{{execute}}

   Now we have a directory that is owned by `root` and allows read and
   write access to the group `music`. Users `bill` and `karen` are
   members of the group `music`, so they can create files in this
   directory.  Other users can only list the contents of the directory
   but cannot create files there.

4. But we still have a problem. Let's try to create a file as user
   `bill`. First let's open another terminal tab: `cd`{{execute T2}}
   
   Login as user `bill`:
   
   `su -l bill`{{execute T2}}
   
   Now let's create an empty file, just for testing:
   
   `> /usr/local/share/Music/test`{{execute}}
   
   `ls -l /usr/local/share/Music`{{execute}}

   The group of the created file is `bill` (which is the primary group
   of the user `bill`). Actually we want the group of the created file
   to be `music`, otherwise `karen` won't be able to access it
   properly.
   
   We can fix this by going to the first terminal tab (where we are
   working as root) and giving this command:
   
   `chmod g+s /usr/local/share/Music`{{execute T1}}
   
   `ls -ld /usr/local/share/Music`{{execute}}
   
   When we talked about permissions we did not mention the special
   permission **s**. When we give this permission to the group of a
   directory, the files that are created on this directory will belong
   to the same group as the directory.
   
   Let's try this by creating another test file from the second
   terminal tab, as user `bill`:

   `> /usr/local/share/Music/test_1`{{execute T2}}
   
   `ls -al /usr/local/share/Music`{{execute}}

