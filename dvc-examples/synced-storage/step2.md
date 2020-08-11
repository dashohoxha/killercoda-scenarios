# Setup local DVC storage and share data

Instead of connecting the project cache directly to the remote DVC
storage, we will connect it instead to a local DVC storage. This local
DVC storage can be synchronized with the remote storage.

1. Click on this command to switch to the first user (on the second
   terminal tab): `cd project/`{{execute T2}}
   
   `mkdir ~/project.cache`{{execute}}
   
   ```
   dvc remote add --local \
       --default local-cache \
       $HOME/project.cache
   ```{{execute}}

   `dvc remote list`{{execute}}
   
   `dvc remote list --local`{{execute}}
   
   `cat .dvc/config.local`{{execute}}
   
   `git status -s`{{execute}}
   
2. Click on this command to switch to the second user (on the third
   terminal tab): `cd project/`{{execute T3}}
   
   `mkdir ~/project.cache`{{execute}}
   
   ```
   dvc remote add --local \
       --default local-cache \
       $HOME/project.cache
   ```{{execute}}

   `dvc remote list`{{execute}}
   
   `dvc remote list --local`{{execute}}
   
   `cat .dvc/config.local`{{execute}}
   
   `git status -s`{{execute}}

3. From the project of the second user, add a data file:

   `fallocate -l 1G data1`{{execute}}
   
   `ls -lh`{{execute}}
   
   `dvc add data1`{{execute}}
   
   `git status -s`{{execute}}
   
   `tree .dvc/cache/`{{execute}}
   
   `git add .`{{execute}}
   
   `git commit -m 'Add data1'`{{execute}}
   
4. Push it:
   
   `git push`{{execute}}
   
   Push cache to the local storage:

   `dvc status -c`{{execute}}
   
   `tree ~/project.cache/`{{execute}}
   
   `dvc push`{{execute}}
   
   `dvc status -c`{{execute}}

   `tree ~/project.cache/`{{execute}}
   
   Synchronize the local storage with the remote one:

   ```
   rsync -r -P \
       ~/project.cache/ \
       dvc-server:/srv/project.cache/
   ```{{execute}}

5. Pull it from the project of the first user:

   First, click on this command to switch to the first user (on the
   second terminal tab): `cd ~/project/`{{execute T2}}
   
   Then pull from Git:
   
   `git pull`{{execute}}
   
   `dvc status`{{execute}}
   
   Synchronize the remote storage with the local one:
   
   `tree ~/project.cache/`{{execute}}
   
   ```
   rsync -r -P \
       dvc-server:/srv/project.cache/ \
       ~/project.cache/
   ```{{execute}}

   `tree ~/project.cache/`{{execute}}
   
   Now pull from the local storage to the project:
   
   `dvc status -c`{{execute}}
   
   `tree .dvc/cache/`{{execute}}
   
   `dvc pull`{{execute}}
   
   `tree .dvc/cache/`{{execute}}
   
   `dvc status -c`{{execute}}
   
   `dvc status`{{execute}}
   
   `ls -lh`{{execute}}
