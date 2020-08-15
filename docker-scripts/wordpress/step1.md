# Install dependencies

1. Install docker-scripts:

   `apt install --yes m4 make`{{execute}}

   ```
   git clone https://gitlab.com/docker-scripts/ds \
       /opt/docker-scripts/ds
   ```{{execute}}

   `cd /opt/docker-scripts/ds/`{{execute}}

   `make install`{{execute}}

   `cd`{{execute}}

2. Install Webserver Proxy:

   `ds pull wsproxy`{{execute}}
   
   `ds init wsproxy @wsproxy`{{execute}}
   
   `cd /var/ds/wsproxy/`{{execute}}
   
   `vim settings.sh`{{execute}}
   
   `ds make`{{execute}}

   `cd`{{execute}}

3. Install MariaDB:

   `ds pull mariadb`{{execute}}
   
   `ds init mariadb @mariadb`{{execute}}
   
   `cd /var/ds/mariadb/`{{execute}}
   
   `vim settings.sh`{{execute}}
   
   `ds make`{{execute}}
   
   `cd`{{execute}}
