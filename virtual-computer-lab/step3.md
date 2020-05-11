# Install a LinuxMint container

1. Get the scripts:

   `ds pull linuxmint`{{execute}}

2. Create a directory for the container:

   `ds init linuxmint @linuxmint`{{execute}}
   
   `cd /var/ds/linuxmint/`{{execute}}

3. Edit `settings.sh` and leave `CONTAINER` as it is (`linuxmint-1`),
   but uncomment epoptes and admin users:
   
   `head -20 settings.sh`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^#EPOPTES_USERS/ c EPOPTES_USERS="admin"' \
       -e '/^#ADMIN_USER/ c ADMIN_USER="admin"' \
       -e '/^#ADMIN_PASS/ c ADMIN_PASS="pass123"'
   ```{{execute}}
   
   `head -20 settings.sh`{{execute}}

4. Let's also add some more accounts on `accounts.txt`:

   `cat accounts.txt`{{execute}}
   
   ```
   cat <<EOF >> accounts.txt
   user3:pass3
   user4:pass4
   EOF
   ```{{execute}}

   `cat accounts.txt`{{execute}}
   
5. Now let's make the container:

   `ds make`{{execute}}

   Be patient and wait for a few minutes.
