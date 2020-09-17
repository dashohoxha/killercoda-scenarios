# Install a second MariaDB container

1. Try to install it on a second dir:

   `ds init mariadb @mariadb-2`{{execute}}
   
   `cd /var/ds/mariadb-2/`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^CONTAINER/ c CONTAINER=mariadb-2'
   ```{{execute}}
   
   `ds make`{{execute}}
   
2. Check the status of `mariadb`:

   `ds shell`{{execute}}
   
   `systemctl status mariadb`{{execute}}
   
   `systemctl restart mariadb`{{execute}}
   
3. Apply the workaround and try again:

   ```
   sed -i /lib/systemd/system/mariadb.service \
    -e '/SendSIGKILL/ c SendSIGKILL=yes'
   ```{{execute}}
   
   `systemctl restart mariadb`{{execute}}
   
   `systemctl status mariadb`{{execute}}
   
