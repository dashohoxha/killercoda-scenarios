# Automount

In the previous sections we have mounted the remote storage manually
with the command `sshfs`. In this section we will see how to mount it
automatically.

**Note:** This step is optional because you can always mount it with
`sshfs`. However in some situations it might be nice to automount.

1. Unmount the directories that we mounted previously with `sshfs`:

   On the second terminal: `whoami`{{execute T2}}
   
   `ls -l ~/data1/`{{execute}}

   `fusermount -u ~/data1/`{{execute}}

   `ls -l ~/data1/`{{execute}}

   On the third terminal: `whoami`{{execute T3}}
   
   `ls -l ~/data2/`{{execute}}

   `fusermount -u ~/data2/`{{execute}}

   `ls -l ~/data2/`{{execute}}

2. Mount the data directory for the first user:

   On the first terminal: `whoami`{{execute T1}}

   Let's do a manual login first, so that the fingerprint of `host01`
   is added on the list of known hosts of the root user:
   
   `ssh user1@host01 -i ~first-user/.ssh/data-server`{{execute}}
   
   `exit`{{execute}}
   
   Get `uid` and `gid` of the first user:
   
   `su - first-user -c id`{{execute}}
   
   Add an entry on `/etc/fstab`:

   ```
   cat << EOF >> /etc/fstab
   user1@host01:/srv/data  /home/first-user/data1  fuse.sshfs  noauto,x-systemd.automount,_netdev,user,idmap=user,follow_symlinks,identityfile=/home/first-user/.ssh/data-server,allow_other,default_permissions,uid=1001,gid=1001  0  0
   EOF
   ```{{execute}}
   
   `cat /etc/fstab | grep first-user`{{execute}}
   
   Reload and restart systemctl:
   
   `systemctl daemon-reload`{{execute}}
   
   `systemctl list-unit-files --type automount`{{execute}}
   
   `systemctl restart 'home-first\x2duser-data1.automount'`{{execute}}
   
   `systemctl status 'home-first\x2duser-data1.automount'`{{execute}}
   
   `ls -al ~first-user/data1/`{{execute}}

3. Mount the data directory for the second user:

   Get `uid` and `gid` of the second user:
   
   `su - second-user -c id`{{execute}}
   
   Add an entry on `/etc/fstab`:

   ```
   cat << EOF >> /etc/fstab
   user2@host01:/srv/data  /home/second-user/data2  fuse.sshfs  noauto,x-systemd.automount,_netdev,user,idmap=user,follow_symlinks,identityfile=/home/second-user/.ssh/data-server,allow_other,default_permissions,uid=1002,gid=1002  0  0
   EOF
   ```{{execute}}
   
   Reload and restart systemctl:
   
   `systemctl daemon-reload`{{execute}}
   
   `systemctl list-unit-files --type automount`{{execute}}
   
   `systemctl restart 'home-second\x2duser-data2.automount'`{{execute}}

   `systemctl status 'home-second\x2duser-data2.automount'`{{execute}}

   `ls -al ~second-user/data2/`{{execute}}
