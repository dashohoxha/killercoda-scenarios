# Test it

1. Open it in browser: 

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. Click on `Sign In` and login as the user `admin` with password `asdf`.

3. Make a backup:

   `ls`{{execute}}
   
   `ds backup`{{execute}}
   
   `ls -lh`{{execute}}
   
4. Use `occ`:

   `ds occ user:list`{{execute}}
   
   `ds occ app:liat`{{execute}}
   
   `ds occ`{{execute}}
   
5. Update the container:

   `ds update`{{execute}}
