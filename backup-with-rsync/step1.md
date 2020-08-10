# Create a backup user

Let's create a backup user with ssh-key access.

1. Create a backup user, for example `backup1` (in ubuntu there is
   already a user named `backup`):

   `useradd backup1 -m`{{execute}}
   
   `ls -al /home/backup1/`{{execute}}

2. Create a ssh key-pair for this user:

   `ssh-keygen -t ecdsa -P '' -q -f key1`{{execute}}

   `ls -l key1*`{{execute}}
   
   `cat key1`{{execute}}
   
   `cat key1.pub`{{execute}}

3. Add the public key to `/home/backup1/.ssh/authorized_keys`:

   `mkdir -p /home/backup1/.ssh`{{execute}}
   
   `chown backup1: /home/backup1/.ssh`{{execute}}
   
   `chmod 700 /home/backup1/.ssh`{{execute}}

   `cat key1.pub >> /home/backup1/.ssh/authorized_keys`{{execute}}
   
   `chown backup1: /home/backup1/.ssh/authorized_keys`{{execute}}
   
   `chmod 600 /home/backup1/.ssh/authorized_keys`{{execute}}

   `ls -al /home/backup1/.ssh/`{{execute}}
   
   `cat /home/backup1/.ssh/authorized_keys`{{execute}}

4. Try to login with this key:

   `ssh -p 22 -i key1 backup1@localhost`{{execute}}

   You should be able to login without a password.
   
   `whoami`{{execute}}
   
   `exit`{{execute}}

5. Try to copy something:

   `mkdir -p /home/backup1/test1`{{execute}}
   
   `touch /home/backup1/test1/file1.txt`{{execute}}
   
   `touch /home/backup1/test1/file2.txt`{{execute}}
   
   `ls -al /home/backup1/test1`{{execute}}
   
   `ls`{{execute}}

   `rsync -a -e "ssh -p 22 -i key1" backup1@localhost:~/test1 .`{{execute}}
   
   `ls`{{execute}}

   `ls -al test1`{{execute}}

   `rm -rf test1`{{execute}}
