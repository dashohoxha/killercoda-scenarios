# Remaking the linuxmint container

1. To reconstruct the linuxmint container you can simply run `ds remake`:

   `cd /var/ds/linuxmint/`{{execute}}
   
   `ds remake`{{execute}}

   The difference between `ds make` and `ds remake` is that `ds remake`
   will make first a backup of user accounts, before
   constructing the new container, and will restore them afterwards.
   
   When reconstructing the container, any changes made to
   `settings.sh` will be applied to the new container. However any
   changes that were made manually to the container will be lost, for
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
   
   Finally build and make the container:
   
   `ds build && ds make`{{execute}}

  This is going to build the image locally (instead of pulling it from
  the docker hub). Usually it takes much longer than just pulling an
  off-the-shelf image.
  
  **Note:** Don't use `ds remake` because it removes first the image
  (that was just built with `ds build`).

3. You can also override the command `ds remake` by creating a local one
   on `cmd/remake.sh`, like this:
   
   `mkdir -p cmd`{{execute}}
   
   ```
   cat << EOF > cmd/remake.sh
   cmd_remake() {
       # backup
       ds users backup

       # reinstall
       ds build
       ds make
       ds restart

       # restore
       local datestamp=$(date +%Y%m%d)
       ds users restore backup/users-$datestamp.tgz
   }
   EOF
   ```{{execute}}

   `ds remake`{{execute}}

   This will run `ds build` and `ds make`, taking care to backup first
   and restore afterwards.
