# Remaking the linuxmint container

1. You can simply run `ds remake`:

   `cd /var/ds/linuxmint/`{{execute}}
   
   `ds remake`{{execute}}

   The difference between `ds make` and `ds remake` is that `ds
   remake` will make first a backup of user accounts, before
   constructing the new container, and will restore them afterwards.
   
   When reconstructing the container, any changes made to
   `settings.sh` will be applied to the new container. However any
   changes that where made manually to the container will be lost, for
   example any new packages installed.
   
2. To rebuild the linuxmint container, with additional packages
   installed, create first a file named `packages`:
   
   ```
   cat <<EOF > packages
   RUN apt install --yes frozen-bubble
   EOF
   ```{{execute}}
   
   Then change the name of the IMAGE on `settings.sh`:
   
   ```
   sed -i settings.sh \
       -e '/^IMAGE/ c IMAGE="linuxmint"'
   ```{{execute}}
   
   `head settings.sh`{{execute}}
   
   Finally build and remake the container:
   
   `ds build && ds remake`{{execute}}

  This is going to build the image locally (instead of pulling it from
  the docker hub).
