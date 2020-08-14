# Setup the central server

In this step we are going to setup the server. In the following steps
we will do the setup for the first user and the second user.

1. Create user accounts.

   For each user that needs to access the central data storage we will
   create an account on the server. Let's assume that we have two
   users and their accounts are named `user1` and `user2`.

   `useradd -m -s /bin/bash user1`{{execute}}
   
   `echo user1:pass1 | chpasswd`{{execute}}
   
   `ls -al /home/user1/`{{execute}}
   
   Create also the second user:
   
   `useradd -m -s /bin/bash user2`{{execute}}
   
   `echo user2:pass2 | chpasswd`{{execute}}

   `ls -al /home/user2/`{{execute}}
   
2. Add the users to the same group, in order to manage their permissions:

   `addgroup data`{{execute}}

   `adduser user1 data`{{execute}}

   `adduser user2 data`{{execute}}
   
3. Create a directory for the data storage and set propper permissions
   to it:

   `mkdir -p /srv/data`{{execute}}
   
   `ls -al /srv/data`{{execute}}

   `chgrp -R data /srv/data`{{execute}}
   
   `chmod -R g+rw /srv/data`{{execute}}

   `chmod -R g+s /srv/data`{{execute}}
   
   `ls -al /srv/data`{{execute}}
   
   Notice the `setgid` permission that we set on the data dir. Because
   of it, the new sub-directories or files that are created inside the
   repo dir will have the same group as the data dir. This is
   convenient for a group of users that use the same directory.

4. Install sshfs:

   `apt install sshfs`{{execute}}
