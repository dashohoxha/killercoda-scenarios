# Test it

1. Let's create a couple of users:

   `ds user`{{execute}}

   `ds user add user1 pass1`{{execute}}
   
   `ds user add user1 pass1234`{{execute}}

   `ds user add user2 pass5678`{{execute}}
   
   `ds user list`{{execute}}

2. Open it in browser and try to login with the first user:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
   Upload a couple of files.
   
3. Let's install the minio-cli:

   `wget https://dl.min.io/client/mc/release/linux-amd64/mc`{{execute}}
   
   `chmod +x mc`{{execute}}
   
   `mv mc /usr/local/bin`{{execute}}
   
   `mc --help`{{execute}}
   
   
