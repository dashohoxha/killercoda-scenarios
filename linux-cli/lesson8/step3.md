# Networking: ssh

1. Another network tool is `ssh`, which can be used to login to a
   remote system, execute commads remotely, and more.

   First let's create a user account:
   
   `useradd -m -s /bin/bash user1`{{execute}}
   
   `echo user1:pass1 | chpasswd`{{execute}}

   Let's login to it:
   
   `ssh user1@localhost`{{execute}}
   
   `ls -al`{{execute}}
   
   `exit`{{execute}}
   
   We can also use `ssh` to just run a command remotely:
   
   `ssh user1@localhost ls -al`{{execute}}
   
   `ssh user1@localhost whoami`{{execute}}
   
   `ssh user1@localhost ls .*`{{execute}}
   
   `ssh user1@localhost 'ls .*'`{{execute}}
   
2. Writting a password each time that we use `ssh` quickly becomes
   tedious. We can use keys instead, which is easier and more secure.
   
   First let's generate a public/private key pair:
   
   `ssh-keygen --help`{{execute}}
   
   `ssh-keygen -t ecdsa -q -N '' -f ~/.ssh/key1`{{execute}}
   
   The option `-N ''` makes it generate a key that does not have a
   passphrase.

   `ls -al ~/.ssh/key1*`{{execute}}
   
   `cat ~/.ssh/key1`{{execute}}
   
   `cat ~/.ssh/key1.pub`{{execute}}
   
   In order to be able to login to the server with this key, we need
   to send the public part of it to the server:

   `ssh-copy-id -i ~/.ssh/key1.pub user1@localhost`{{execute}}
   
   Now let's try to login using the private key as an identity file:
   
   `ssh -i ~/.ssh/key1 user1@localhost`{{execute}}
   
   `ls -al`{{execute}}
   
   `cat .ssh/authorized_keys`{{execute}}
   
   `exit`{{execute}}
   
   `cat ~/.ssh/key1.pub`{{execute}}
   
   You may notice that the public key has been appended to
   `.ssh/authorized_keys` on the server.

   It get's even better. Let's add this configuration to
   `~/.ssh/config`:
   
   ```
   cat <<EOF >> ~/.ssh/config
Host server1
    HostName 127.0.0.1
    User user1
    IdentityFile ~/.ssh/key1
EOF```{{execute}}

   `cat ~/.ssh/config`{{execute}}
   
   Now we can just use `ssh` with the name `server1`, without having
   to specify the hostname (or IP) of the server, the username, the
   identity file etc. It will get them automatically from the config
   file.
   
   `ssh server1`{{execute}}
   
   `exit`{{execute}}
   
   `ssh server1 whoami`{{execute}}
   
3. Using `scp`, `sftp`, `rsync` etc.

   All these tools use an SSH tunnel for a secure communication with
   the server. Now that we have an easy `ssh` access to the server, we
   can also use easily these tools:
   
   `touch foo.txt`{{execute}}
   
   `scp foo.txt server1:`{{execute}}
   
   `ssh server1 ls -l`{{execute}}
   
   `ssh server1 touch bar.txt`{{execute}}
   
   `ssh server1 ls -l`{{execute}}
   
   `scp server1:bar.txt .`{{execute}}
   
   `ls -l bar.txt`{{execute}}
   
   `sftp`:
   
   `sftp server1`{{execute}}
   
   `ls`{{execute}}
   
   `help`{{execute}}
   
   `quit`{{execute}}

   `rsync`:
   
   `ls testdir`{{execute}}
   
   `rsync -av testdir server1:`{{execute}}
   
   `ssh server1 ls`{{execute}}
   
   `ssh server1 ls testdir`{{execute}}
