# Test it

1. Let's create a couple of users:

   `ds user`{{execute}}

   `ds user add user1 pass1`{{execute}}
   
   `ds user add user1 pass1234`{{execute}}

   `ds user add user2 pass5678`{{execute}}
   
   `ds user list`{{execute}}

2. Open it in browser and try to login with the first user:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
