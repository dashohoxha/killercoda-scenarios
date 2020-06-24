# Install MinIO

1. Get the scripts:

   `ds pull minio`{{execute}}

2. Create a directory for the container:

   `ds init minio @minio`{{execute}}
   
3. We are going to make an installation without
   [wsproxy](https://gitlab.com/docker-scripts/wsproxy), so let's make
   sure that the port `443` is forwarded to the container:

   `cd /var/ds/minio/`{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^#PORTS/ c PORTS="443:443"'
   ```{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
4. Also let's comment out the `DOMAIN` and `SSL_CERT_EMAIL` on
   `settings.sh` (which are used by `wsproxy`):
   
   `head settings.sh`{{execute}}
   
   ```
   sed -i settings.sh \
       -e 's/^DOMAIN/#DOMAIN/' \
       -e 's/^SSL_CERT/#SSL_CERT/'
   ```{{execute}}
   
   `head settings.sh`{{execute}}

5. Build image, create the container and configure it:

   `ds make`{{execute}}
