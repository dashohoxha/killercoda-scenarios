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

5. Build image, create the container and configure it:

   `ds make`{{execute}}

   If the domain is not `gitea.example.org` and `ADMIN_PASS` is unchanged
   (`123456`), the configuration script would fail and ask for changing
   `ADMIN_PASS` on `settings.sh`.

6. Let's make sure that `ADMIN_USER` and `ADMIN_PASS` are changed, and let's try
   it again.

   Set admin user to `user1`:

   ```
   sed -i settings.sh \
       -e '/^ADMIN_USER/ c ADMIN_USER="user1"'
   ```{{execute}}
   
   `cat settings.sh | grep ^ADMIN_USER`{{execute}}
   
   **Note:** The `ADMIN_USER` should not be `admin` or `user` because
   these names are reserved by Gitea.
   
   Set the admin password to `asdf`:
   
   ```
   sed -i settings.sh \
       -e '/^ADMIN_PASS/ c ADMIN_PASS="asdf"'
   ```{{execute}}
   
   `cat settings.sh | grep ^ADMIN_PASS`{{execute}}
   
   `ds make`{{execute}}
