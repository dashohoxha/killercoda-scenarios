# Using a script

The script on https://gitlab.com/snippets/1943582 can help to create,
mount and unmount an encrypted archive.
   
1. Get it:

   ```
   wget -q -O archive.sh \
       https://gitlab.com/snippets/1943582/raw
   ```{{execute}}
   
   `ls -lh`{{execute}}
   
   `less archive.sh`{{execute}}
   
   `chmod +x archive.sh`{{execute}}
   
   `ls -lh`{{execute}}
   
2. Create a new archive:
   
   `./archive.sh create archive2.img`{{execute}}
   
   `ls -lh`{{execute}}
   
3. Mount this archive:

   `./archive.sh mount archive2.img`{{execute}}
   
   `ls -lh`{{execute}}
   
   `lsblk`{{execute}
   
   `df -h`{{execute}}
   
   `df -h archive2/`{{execute}}
   
   `ls /dev/mapper/`{{execute}}

4. Unmount it:

   `./archive.sh unmount archive2.img`{{execute}}
   
   `ls -lh`{{execute}}
   
   `lsblk`{{execute}
   
   `df -h`{{execute}}
   
   `ls /dev/mapper/`{{execute}}

