# Sharing data

With this setup we can share data by using the central data storage as
a mediator.

1. From the home of the second user create a data file:

   On the third terminal tab: `cd`{{execute T3}}

   `fallocate -l 1G datafile`{{execute}}
   
   `mv datafile data2/`{{execute}}
   
   `ls -lR`{{execute}}
   
2. Let's check the data directory on the server:
   
   On the first terminal tab: `cd`{{execute T1}}

   `ls -l /srv/data/`{{execute}}

   The datafile that we placed on `data2/` of the second user, has
   already been transferred to the server, because that is a mounted
   remote directory.
   
3. Let's check the `data1/` on the home of the first user:
   
   On the second terminal tab: `cd`{{execute T2}}
   
   `ls -al data1/`{{execute}}

   This one is as well a mounted remote directory, so whatever is on
   the server is available here.
