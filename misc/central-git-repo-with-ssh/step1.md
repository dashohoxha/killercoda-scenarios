# Setup the central server

In this step we are going to setup the server. In the following steps
we will do the setup for the first user and the second user.

1. Create user accounts.

   For each user that needs to access the central repo we will create
   an account on the server. Let's assume that we have two users and
   their accounts are named `user1` and `user2`.

   `useradd -m -s /bin/bash user1`{{execute}}
   
   `echo user1:pass1 | chpasswd`{{execute}}
   
   `ls -al /home/user1/`{{execute}}
   
   Create also the second user:
   
   `useradd -m -s /bin/bash user2`{{execute}}
   
   `echo user2:pass2 | chpasswd`{{execute}}

   `ls -al /home/user2/`{{execute}}
   
2. Create a group for Git:

   `addgroup git-group`{{execute}}

   In order to manage the read and write permissions to the Git repo
   for the users that we created, we will add them to this group:

   `adduser user1 git-group`{{execute}}

   `adduser user2 git-group`{{execute}}
   
3. Create a bare Git repository for the project:

   `git init --bare --shared /srv/project.git`{{execute}}
   
   Central Git repositories don't have a working tree. They are called
   "bare" repositories and are initialized with the option `--bare`.
   
   The option `--shared` specifies that this Git repository is to be
   shared amongst several users. This allows users belonging to the
   same group to push into this repository.
   
   `cd /srv/project.git`{{execute}}
   
   `ls -al`{{execute}}
   
   Now let's set the right group ownership to this repo:

   `chgrp -R git-group .`{{execute}}
   
   `chmod -R g+rw .`{{execute}}

   `chmod -R g+s .`{{execute}}
   
   Notice the `setgid` permission that we set on the repo dir. Because
   of it, the new sub-directories or files that are created inside the
   repo dir will have the same group as the repo dir
   (`git-group`). This is convenient for a group of users that use the
   same directory.

   `ls -al`{{execute}}
   
   `cd -`{{execute}}
