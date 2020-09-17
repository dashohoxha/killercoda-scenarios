# Install MariaDB

1. Get the scripts:

   `ds pull mariadb`{{execute}}
   
2. Remove the workaround:

   `cd /opt/docker-scripts/mariadb/`{{execute}}
   
   `cat scripts/mariadb.sh`{{eceute}}

   ```
   sed -i scripts/mariadb.sh \
       -e '/fix a bug with systemd/,+3d'
   ```{{execute}}

   `cat scripts/mariadb.sh`{{eceute}}

3. Initialize a directory for the container:

   `ds init mariadb @mariadb-1`{{execute}}

4. Make the container:

   `cd /var/ds/mariadb-1/`{{execute}}

   ```
   sed -i settings.sh \
       -e '/^CONTAINER/ c CONTAINER=mariadb-1'
   ```{{execute}}
   
   `ds make`{{execute}}

5. Check the status of `mariadb`:

   `ds exec systemctl status mariadb`{{execute}}
   
   `ds shell`{{execute}}
   
   `systemctl status mariadb`{{execute}}
   
   `exit`{{execute}}
