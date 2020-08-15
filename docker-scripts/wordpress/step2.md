# Install Wordpress sites

1. Install a wordpress container:

   `ds pull wordpress`{{execute}}
   
   `ds init wordpress @wordpress1`{{execute}}
   
   `cd /var/ds/wordpress1/`{{execute}}
   
   `vim settings.sh`{{execute}}
   
   `ds make`{{execute}}

2. Install a site:

   `cd /var/ds/wordpress1/`{{execute}}
   
   Sites are managed with the command `ds site`:
   
   `ds site`{{execute}}
   
   `ds site init site1.example.org`{{execute}}
   
   `ls`{{execute}}
   
   `ls site1.example.org`{{execute}}
   
   `ls apache2/sites-enabled/`{{execute}}
   
   `cat apache2/sites-enabled/site1.example.org.conf`{{execute}}
   
   `ls ../wsproxy/sites-enabled/`{{execute}}
   
   `cat ../wsproxy/sites-enabled/site1.example.org.conf`{{execute}}
   
   Initializing a site with `ds site init <domain>` not only creates a
   directory for this site, but also creates the necessary virtual
   domain configurations for it on the containers **wsproxy** and
   **wordpress1** (the current container). It also gets a free SSL
   certificate from LetsEncrypt for this site/domain.
   
   After initializing the site, we can customize its `settings.sh` and
   then install wordpress in it (with `ds site install`):

   `vim site1.example.org/settings.sh`{{execute}}
   
   `ds site install site1.example.org`{{execute}}
   
   `ls site1.example.org/`{{execute}}

   Now you can open in browser https://site1.example.org and login as
   admin.

3. Installing another site on the same container is almost the same:

   `cd /var/ds/wordpress1/`{{execute}}
   
   `ds site init site2.example.org`{{execute}}
   
   `ls`{{execute}}
   
   `ls site2.example.org`{{execute}}
   
   `ls apache2/sites-enabled/`{{execute}}

   `ls ../wsproxy/sites-enabled/`{{execute}}

   `vim site2.example.org/settings.sh`{{execute}}
   
   `ds site install site2.example.org`{{execute}}
   
   `ls site2.example.org/`{{execute}}

4. Install a second container:

   `ds init wordpress @wordpress2`{{execute}}
   
   `cd /var/ds/wordpress2/`{{execute}}
   
   `vim settings.sh`{{execute}}
   
   `ds make`{{execute}}

5. Install a site on the second container

   `cd /var/ds/wordpress2/`{{execute}}
   
   `ds site init site3.example.org`{{execute}}
   
   `vim site3.example.org/settings.sh`{{execute}}
   
   `ds site install site3.example.org`{{execute}}
