# Using a script

1. For convenience, we can combine the command and the key in a bash
   script like this:

   ```
   cat << 'EOF' > backup-server.sh
   #!/bin/bash

   server=127.0.0.1
   port=22
   
   cd $(dirname $0)
   rsync -a -e "ssh -p $port -i $0" backup1@${server}: .
   
   exit 0
   
   EOF
   ```{{execute}}
   
   `cat key1 >> backup-server.sh`{{execute}}
   
   `cat backup-server.sh`{{execute}}

2. Let's try it:

   `chmod 700 backup-server.sh`{{execute}}
   
   `rm -rf test1/`{{execute}}
   
   `./backup-server.sh`{{execute}}
   
   `ls -l test1/`{{execute}}

   `rm -rf test1/`{{execute}}

3. Let's also fix the directory on the server that is being backed
   up. We should edit `/home/backup1/.ssh/authorized_keys` and change
   `~/test1` to `/mnt/backup-server`:
   
   ```
   sed -i /home/backup1/.ssh/authorized_keys \
       -e 's#~/test1#/mnt/backup-server#'
   ```{{execute}}

   `cat /home/backup1/.ssh/authorized_keys`{{execute}}
   
4. Now we can move this script to the client (backup server), making
   sure to set the proper values for the variables `server` and
   `port`, and it should work.

5. On the client (computer that is getting the backup), we can place the script `backup-server.sh`
   on a directory like `/var/backup`:

   `mkdir -p /var/backup`{{execute}}
   
   `mv backup-server.sh /var/backup/`{{execute}}
   
   `cd /var/backup/`{{execute}}
   
   `./backup-server.sh`{{execute}}
   
   `tree`{{execute}}

6. Let's also create a cron job that runs this script periodically each week:

   ```
   cat <<EOF > /etc/cron.d/backup-server
   # backup the server each tuesday
   0 0 * * TUE  root  /var/backup/backup-server.sh
   EOF
   ```{{execute}}
   
   `cat /etc/cron.d/backup-server`{{execute}}
