# Restrict the ssh key

Restrict the ssh key of the backup user for using only `rsync`.

1. Let's find out the command that the client is sending to the server
   through SSH.
   
   Let's try the same `rsync` command again, with the added SSH switch
   `-v` (verbose):

   `rsync -a -e "ssh -p 22 -i key1 -v" backup1@localhost:~/test1 . `{{execute}}

   Then let's look for the debug line that says "Sending command":

   ```
   rsync -a -e "ssh -p 22 -i key1 -v" backup1@localhost:~/test1 . 2>&1 \
   | grep "Sending command"
   ```{{execute}}

   It should be something like this:

   ```
   rsync --server --sender -logDtpre.iLsfxC . ~/test1
   ```
   
2. We can restrict the SSH key `key1` to execute only this command and
   nothing else.  For this we need to add something like this before
   the public key on `/home/backup1/.ssh/authorized_keys`:

   ```
   command="rsync --server --sender -logDtpre.iLsfxC . ~/test1" ecdsa-sha2-nistp256 AAAAE2Vj....
   ```
   ```

   To make it even more secure, we can also add the options
   `no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding`.
   The file `/home/backup1/.ssh/authorized_keys` should look like this:

   ```
   command="rsync --server --sender -logDtpre.iLsfxC . ~/test1",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMbMdR9uW4SMeinpVvr6UQZaFybkiVZxm2DRYxFlCuxHchpTMGR7U4gZGZwY4D5LQDDy1Py4TWSsEizda4LecgQ= root@server
   ```
   
   ```
   sed -i /home/backup1/.ssh/authorized_keys \
       -e '1 s#^#command="rsync --server --sender -logDtpre.iLsfxC . ~/test1",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding #'
   ```{{execute}}
   
   `cat /home/backup1/.ssh/authorized_keys`{{execute}}
   
3. Let's check that now we cannot login with `key1` anymore, but we
   can still use it to `rsync`:

   `ssh -p 22 -i key1 backup1@localhost`{{execute}}
   
   It should fail. Cancel it with `Ctrl+c`.

   `rm -rf test1`{{execute}}
   
   `rsync -a -e "ssh -p 22 -i key1" backup1@localhost:~/test1 .`{{execute}}
   
   `ls -l test1`{{execute}}

   `rm -rf test1`{{execute}}
   
   `rsync -a -e "ssh -p 22 -i key1" backup1@localhost: .`{{execute}}
   
   `ls -l test1`{{execute}}
   
   `rm -rf test1`{{execute}}
