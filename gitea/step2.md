# Install Gitea

1. Get the scripts:

   `ds pull gitea`{{execute}}

2. Create a directory for the container:

   `ds init gitea @gitea`{{execute}}
   
3. Add the port `443` to the settings:

   `cd /var/ds/gitea/`{{execute}}
   
   `cat settings.sh | grep PORT`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/PORT="/PORT="443:443 /'
   ```{{execute}}
   
   `cat settings.sh | grep PORT`{{execute}}
   
4. Build image, create the container and configure it:

   `ds make`{{execute}}
