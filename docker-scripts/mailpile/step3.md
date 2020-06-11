# Use Mailpile

1. Add user accounts:

   `ds user start user1 user2`{{execute}}
   
   `ls accounts/`{{execute}}

2. Open it in browser and login as `user1`:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
   Then logout and login as `user2`.
   
3. Rebuild the container:

   User accounts are on `accounts/`, so we don't need to backup
   anything. Just run:
   
   `ds remake`{{execute}}

   After it is done, login as `user1` and verify that it has been
   preserved.
