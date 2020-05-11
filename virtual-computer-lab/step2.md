# Install Guacamole

1. Get the scripts:

   `ds pull guacamole`{{execute}}

2. Create a directory for the container:

   `ds init guacamole @guacamole`{{execute}}
   
3. We are going to make an installation without
   [wsproxy](https://gitlab.com/docker-scripts/wsproxy), so let's make
   sure that the port `443` is forwarded to the container:

   `cd /var/ds/guacamole/`{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^#PORTS/ c PORTS="443:443"'
   ```{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
4. Also let's comment out the `DOMAIN` and `SSL_CERT_EMAIL` on
   `settings.sh` (which are used by `wsproxy`):
   
   ```
   sed -i settings.sh \
       -e 's/^DOMAIN/#DOMAIN/' \
       -e 's/^SSL_CERT/#SSL_CERT/'
   ```{{execute}}
   
   `head -20 settings.sh`{{execute}}
   
5. We also need to change the password of the guacamole admin
   (otherwise the installation script will refuse to proceed):

   ```
   sed -i settings.sh \
       -e '/^PASS/ c PASS="pass123"'
   ```{{execute}}
   
   `head -20 settings.sh`{{execute}}

6. Now let's make the container:

   `ds make`{{execute}}

   Be patient and wait for a few minutes.

7. Open this url in another browser tab and login as admin:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
   You will notice that there are no connections available, but we are
   going to fix this soon (in the next steps).
