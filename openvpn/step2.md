# Initialize and start the OpenVPN server

1. Initialize the configuration files:

   ```
   docker-compose run --rm openvpn \
       ovpn_genconfig -u udp://ovpn.example.org
   ```{{execute}}

   Instead of the FQDN of the server we could also use its IP.

2. Initialize the PKI:

   ```
   docker-compose run --rm openvpn \
       ovpn_initpki
   ```{{execute}}
   
   You will be asked for the CA key passphrase.

3. Start the OpenVPN server:

   `docker-compose up -d openvpn`{{execute}}
   
   `docker-compose ps`{{execute}}

   You can access the container logs with:
   
   `docker-compose logs`{{execute}}
   
