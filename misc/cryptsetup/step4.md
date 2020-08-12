# Close the archive
   
1. Unmount the encrypted device:

   `umount /dev/mapper/archive1`{{execute}}
   
   `df -h`{{execute}}
   
   `ls -al archive1/`{{execute}}
   
   `lsblk`{{execute}}
   
   `ls /dev/mapper/`{{execute}}

   Optionally, remove the directory as well:

   `rmdir archive1/`{{execute}}
   
2. Close the encrypted device:
   
   `cryptsetup luksClose archive1`{{execute}}
   
   `ls /dev/mapper/`{{execute}}
   
   `lsblk`{{execute}}
   
3. Optionally, remove the loopback device as well:

   `losetup -a | grep archive1.img`{{execute}}
   
   `losetup -d /dev/loop0`{{execute}}
   
   `losetup -a`{{execute}}
   
   `lsblk`{{execute}}
