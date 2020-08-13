# Second user setup

We will do a similar setup for the second user, which for the sake of
example is called `second-user` and has the account `user2` on the
server.

Click on this command to switch to the second user on another terminal
tab: `su - second-user`{{execute T3}}

Then continue with the following steps:

1. Set up the ssh config for the central Git server:
   
   `mkdir ~/.ssh`{{execute}}
   
   `chmod 700 ~/.ssh/`{{execute}}
   
   ```
   cat <<EOF >> ~/.ssh/config
   Host git-server
       HostName host01
       User user2
       IdentityFile ~/.ssh/git-server
       IdentitiesOnly yes 
   EOF
   ```{{execute}}
   
   `cat ~/.ssh/config`{{execute}}
   
2. Create an SSH key with the filename (`~/.ssh/git-server`) that we
   used above:

   ```
   ssh-keygen -t rsa -q -N '' \
       -f ~/.ssh/git-server
   ```{{execute}}
   ```
   
   `ls -al ~/.ssh/`{{execute}}
   
3. Send the public key to the server:
   
   `ssh-copy-id -i ~/.ssh/git-server.pub git-server`{{execute}}
   
   (**Reminder:** The password is `pass2`)
   
   Now let's try to *ssh* to the server with the new key (should be
   able to do it without a password):
   
   `ssh git-server ls -al .ssh/`{{execute}}
   
   ```
   ssh git-server \
       cat .ssh/authorized_keys
   ```{{execute}}
   ```
   
   `cat  ~/.ssh/git-server.pub`{{execute}}
   
   Again, the public key that we sent to the server has been appended
   to `.ssh/authorized_keys` on the home directory of `user2`.

4. Clone the Git project:

   ```
   git clone \
       git-server:/srv/project.git
   ```{{execute}}

   `cd project/`{{execute}}
   
   `git remote -v`{{execute}}
   
   `git log --oneline`{{execute}}
   
   This time we didn't have to add a *remote*, because the `origin`
   remote is added automatically when we clone the project.
