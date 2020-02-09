# Install OpenVPN in container

1. Make sure that docker and docker-compose are installed:

   `docker --version`{{execute}}
   
   `docker-compose --version`{{execute}}
   
2. Make a directory for openvpn:

   `mkdir openvpn`{{execute}}
   
   `cd openvpn`{{execute}}
   
   `pwd`{{execute}}
   
3. Create `docker-compose.yml` with a content like this:

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
        - "443:1194/tcp"
       restart: always
       volumes:
        - ./openvpn-data/conf:/etc/openvpn
   EOF
   ```{{execute}}

   `ls`{{execute}}
   
   `cat docker-compose.yml`{{execute}}
   
   We are forwarding the port `443/tcp` to `1194` because this one is
   open on Katacoda. Normally (in another case) it should be like this
   `"1194:1194/udp"`. We should also make sure that the port
   `1194/udp` is open in the firewall, for example like this:
   `ufw allow 1194/udp`.

4. Initialize the configuration files and certificates:

   ```
   docker-compose run --rm openvpn \
       ovpn_genconfig -u tcp://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com:443
   ```{{execute}}

   Again, normally it would be `udp://...`, and if the port is the
   default one (`1194`), no need to append it at the end (like
   `:443`).
   
   Instead of the FQDN of the server we could also use its IP.
   
   ```
   docker-compose run --rm openvpn \
       ovpn_initpki
   ```{{execute}}
   
   You will be asked for the CA key passphrase.

5. Start the OpenVPN server:

   `docker-compose up -d openvpn`{{execute}}
   
   `docker-compose ps`{{execute}}

   You can access the container logs with:
   
   `docker-compose logs`{{execute}}
   
6. Generate a client certificate:

   ```
   docker-compose run --rm openvpn \
       easyrsa build-client-full client1 nopass
   ```{{execute}}
   
   Don't add the option `nopass` if you want a passphrase protected
   certificate.
   
7. Retrieve the client configuration with embedded certificates:

   ```
   docker-compose run --rm openvpn \
       ovpn_getclient client1 > client1.conf
   ```{{execute}}

   `ls`{{execute}}
   
   `less client1.conf`{{execute}}
