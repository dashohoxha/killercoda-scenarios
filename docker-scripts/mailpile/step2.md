# Install Mailpile

1. Get the scripts:

   `ds pull mailpile`{{execute}}

2. Create a directory for the container:

   `ds init mailpile @mailpile`{{execute}}
   
3. Make sure that the port `443` is forwarded to the container:

   `cd /var/ds/moodle/`{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^CONTAINER/ a PORTS="443:443"'
   ```{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   **Note:** If we had used [wsproxy](https://gitlab.com/docker-scripts/wsproxy)
   we would not need to forward the port `443` to the container.

4. Edit `settings.sh` and set:

   `DOMAIN=[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com`
   
   ```
   domain=[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com
   sed -i settings.sh \
       -e "/^DOMAIN/ c DOMAIN=$domain"
   ```{{execute}}

   `cat settings.sh | grep ^DOMAIN`{{execute}}

5. Make the container:

   `ds make`{{execute}}
