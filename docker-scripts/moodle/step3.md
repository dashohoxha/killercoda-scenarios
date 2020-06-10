# Test it

1. Open it in browser and login as the user `admin`:

   `grep ADMIN_ settings.sh`{{execute}}

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. Install another plugin:

   `ds inject install-plugins.sh mod_bigbluebuttonbn`{{execute}}
   
2. Make a backup and restore:

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
