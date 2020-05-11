# Test it

1. Open it in browser and login as the user `admin` with password `asdf`:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. Make a backup:

   `ls`{{execute}}
   
   `ds backup`{{execute}}
   
   `ls -lh`{{execute}}
   
3. Use `occ`:

   `ds occ user:list`{{execute}}
   
   `ds occ app:list`{{execute}}
   
   `ds occ`{{execute}}
   
4. Update the container:

   `ds update`{{execute}}

   `ds restart`{{execute}}
