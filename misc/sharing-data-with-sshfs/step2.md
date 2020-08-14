# First user setup

For the sake of example, let's name the first user as `first-user`. He
is going to use the account `user1` on the server. Let's see the
configuration steps that he should do on his side (on his computer).

<p align="center">
<img src="/dashohoxha/courses/misc/sharing-data-with-sshfs/assets/sshfs-data-sharing.png">
</p>

Click on this command to switch to the first user on another terminal
tab: `su - first-user`{{execute T2}}

Then continue with the following steps:

1. Set up the ssh config for the data server:
   
   `mkdir ~/.ssh`{{execute}}
   
   `chmod 700 ~/.ssh/`{{execute}}
   
   SSH client configurations are usually kept on the directory
   `~/.ssh/`, and it should be accessible only by the owner.
   
   ```
   cat <<EOF >> ~/.ssh/config
   Host data-server
       HostName host01
       User user1
       IdentityFile ~/.ssh/data-server
       IdentitiesOnly yes 
   EOF
   ```{{execute}}

   `cat ~/.ssh/config`{{execute}}
   
   In this configuration entry we describe the details for the
   **Host** (server) named `data-server`, which is an arbitrary name
   (we choose it). Its **HostName** in our example is `host01` (which
   in our case resolves to the localhost, however usually it is a FQDN
   or an IP).
   
   The **User** account on the server `host01` is `user1`, and we will
   login there with an SSH key (**IdentityFile**) that is located on
   `~/.ssh/data-server`.
   
2. The SSH key above doesn't exist yet, so let's create it:

   `ssh-keygen --help`{{execute}}

   ```
   ssh-keygen -t rsa -q -N '' \
       -f ~/.ssh/data-server
   ```{{execute}}
   
   The option `-N ''` tells the command to use no passphrase for
   encrypting the private key, and `-f ~/.ssh/data-server` gives it the
   filename where the key should be saved.
   
   `ls -al ~/.ssh/`{{execute}}
   
3. In order to be able to login to the server with this key, we need
   to send the public part of it to the server:
   
   `ssh-copy-id -i ~/.ssh/data-server.pub data-server`{{execute}}
   
   (**Reminder:** The password is `pass1`)
   
   Now let's try to *ssh* to the server with the new key (should be
   able to do it without a password):
   
   `ssh data-server ls -al .ssh/`{{execute}}
   
   The command `ls -al .ssh/` is running on the server, through ssh.
   
   ```
   ssh data-server \
       cat .ssh/authorized_keys
   ```{{execute}}
   
   `cat ~/.ssh/data-server.pub`{{execute}}
   
   Notice that the public key that we sent to the server has been
   appended to `.ssh/authorized_keys` on the home directory of
   `user1`.
   
4. Now that we configured an SSH connection to the server, let's
   mount with sshfs the data directory from the server

   `mkdir -p data1`{{execute}}

   ```
   sshfs data-server:/srv/data data1
   ```{{execute}}

   `df -h data1/`{{execute}}
