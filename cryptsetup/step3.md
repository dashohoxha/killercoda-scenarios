# Open the archive

1. Attach it to a loop device:

   `losetup -f archive1.img`{{execute}}
   
   `losetup -a`{{execute}}
   
   `lsblk`{{execute}}
   
2. Create an encrypted virtual device:

   `cryptsetup luksOpen /dev/loop0 archive1`{{execute}}
   
   `ls /dev/mapper/`{{execute}}
   
   `lsblk`{{execute}}
   
3. Mount the encrypted device:

   `mkdir -p archive1`{{execute}}
   
   `mount /dev/mapper/archive1 archive1`{{execute}}
   
   `ls`{{execute}}
   
   `df -h`{{execute}}

4. Create a file in it:

   `touch archive1/personal_data`{{execute}}
   
   `ls -al archive1/`{{execute}}
