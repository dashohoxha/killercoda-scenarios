# Install docker-scripts

This installation of Gitea is based on
[docker-scripts](https://gitlab.com/docker-scripts/ds) so let's
install it first:

1. `apt install --yes m4`{{execute}}

2. ```
   git clone https://gitlab.com/docker-scripts/ds \
       /opt/docker-scripts/ds
   ```{{execute}}

3. `cd /opt/docker-scripts/ds/`{{execute}}

4. `make install`{{execute}}

5. `cd`{{execute}}

   `ds`{{execute}}

   `ds -h`{{execute}}
