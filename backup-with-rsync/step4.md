# Create a read-only view

Create a read-only view of the parts of the filesystem that need to be
backed up. Let's say for example that we are using **docker-scripts**
for installing and managing apps. Then, the directories that we need
to backup are: `/opt/docker-scripts` and `/var/ds`.

1. For the sake of testing, let's create these directories with some
   dummy content:
   
   `mkdir -p /opt/docker-scripts/{app1,app2,app3}`{{execute}}
   
   `mkdir -p /var/ds/{dir1,dir2,dir3,dir4}`{{execute}}


2. Install `bindfs`:

   `apt list bindfs`{{execute}}
   
   `apt show bindfs`{{execute}}
   
   `apt install bindfs`{{execute}}

3. Create mount directories:

   `mkdir -p /mnt/backup-server/scripts`{{execute}}
   
   `mkdir -p /mnt/backup-server/apps`{{execute}}

4. Add these lines to `/etc/fstab` for mounting directories read-only:

   ```
   cat <<EOF >> /etc/fstab
   /opt/docker-scripts /mnt/backup-server/scripts fuse.bindfs perms=0000:u=rD,force-user=backup1,force-group=nogroup 0 0
   /var/ds             /mnt/backup-server/apps    fuse.bindfs perms=0000:u=rD,force-user=backup1,force-group=nogroup 0 0
   EOF
   ```{{execute}}

5. Mount them:

   `mount -a`{{execute}}
   
   `ls -al /mnt/backup-server/scripts`{{execute}}
   
   `ls -al /mnt/backup-server/apps`{{execute}}

6. Test that they are read-only:

   ```
   sudo -u backup1 \
       ls -al /mnt/backup-server/scripts
   ```{{execute}}
   
   ```
   sudo -u backup1 \
       touch /mnt/backup-server/scripts/test1.txt
   ```{{execute}}
