# Setup the docker-compose container

1. Make sure that docker and docker-compose are installed:

   `docker --version`{{execute}}
   
   `docker-compose --version`{{execute}}
   
2. Make a directory for openvpn:

   `mkdir openvpn`{{execute}}
   
   `cd openvpn`{{execute}}
   
   `pwd`{{execute}}
   
3. Create `docker-compose.yml` like this:

   ```
   cat << EOF > docker-compose.yml
   version: '2'
   services:
     openvpn:
       cap_add:
        - NET_ADMIN
       image: kylemanna/openvpn
       container_name: openvpn
       ports:
        - "1194:1194/udp"
       restart: always
       volumes:
        - ./openvpn-data/conf:/etc/openvpn
   EOF
   ```{{execute}}

   `ls`{{execute}}
   
   `cat docker-compose.yml`{{execute}}
   
   **Note:** We should also make sure that the port `1194/udp` is open
   in the firewall, for example like this: `ufw allow 1194/udp`.
