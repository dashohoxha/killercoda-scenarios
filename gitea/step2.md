# Install Gitea

1. Get the scripts:

   `ds pull gitea`{{execute}}

2. Create a directory for the container:

   `ds init gitea @gitea`{{execute}}
   
3. Make sure that the port `443` is forwarded to the container:

   `cd /var/ds/gitea/`{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   ```
   sed -i settings.sh \
       -e '/^CONTAINER/ a PORTS="443:443"'
   ```{{execute}}
   
   `cat settings.sh | grep PORTS`{{execute}}
   
   If we had used [wsproxy](https://gitlab.com/docker-scripts/wsproxy)
   we would not need to forward the port `443` to the container.

4. Optionally, edit `settings.sh` and change the admin username and
   password (`ADMIN_USER`, `ADMIN_PASS`).
   
   **Note:** The username should not be `admin` or `user` because
   these names are reserved by Gitea.
   
   For this example installation this step is not necessary, however
   for a real installation it would be.

5. Build image, create the container and configure it:

   `ds make`{{execute}}

   If the domain is not `gitea.example.org` and `ADMIN_PASS` is
   unchanged (`123456`), the configuration script would fail and ask
   us to change `ADMIN_PASS` on `settings.sh`.
