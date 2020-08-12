# Create OpenVPN clients

1. Generate a client certificate:

   ```
   docker-compose run --rm openvpn \
       easyrsa build-client-full client1 nopass
   ```{{execute}}
   
   Don't add the option `nopass` if you want a passphrase protected
   certificate.
   
   ```
   docker-compose run --rm openvpn \
       easyrsa build-client-full client2
   ```{{execute}}
   
2. Retrieve the client configuration with embedded certificates:

   ```
   docker-compose run --rm openvpn \
       ovpn_getclient client1 > client1.ovpn
   ```{{execute}}

   ```
   docker-compose run --rm openvpn \
       ovpn_getclient client2 > client2.ovpn
   ```{{execute}}

   `ls`{{execute}}
   
   `less client1.ovpn`{{execute}}

3. To revoke client certificates do:

   ```
   docker-compose run --rm openvpn \
       ovpn_revokeclient client1
   ```{{execute}}
   
   This keeps the corresponding crt, key and req files. To remove them
   as well, use the option `remove`:

   ```
   docker-compose run --rm openvpn \
       ovpn_revokeclient client2 remove
   ```{{execute}}
   
