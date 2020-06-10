# Test it

1. Open it in browser and login as the user `admin`:

   `grep ADMIN_USER settings.sh`{{execute}}

   `grep ADMIN_PASS settings.sh`{{execute}}

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. Make a backup:

   `ls`{{execute}}
   
   `ds backup`{{execute}}
   
   `ls -lh`{{execute}}
   
   `ds restore backup-*.tgz`{{execute}}
   
3. Update:

   `ds update`{{execute}}
   
4. Upgrade:

   `ds upgrade`{{execute}}

   `ds upgrade MOODLE_37_STABLE`{{execute}}

   `ds upgrade MOODLE_38_STABLE`{{execute}}

5. Remake:

   `ds remake`{{execute}}
