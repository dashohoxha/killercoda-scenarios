# Create the archive

1. Make sure that `cryptsetup` is installed:

   `apt list cryptsetup`{{execute}}
   
   `apt install cryptsetup`{{execute}}
   
2. Create an image file for the archive:

   `fallocate -l 15G archive1.img`{{execute}}
   
   `ls -lh`{{execute}}
   
   However, to make sure that the created file has random data, you
   can use a command like this (which is slower):
   
   `dd if=/dev/urandom of=archive1.img bs=10M count=100`{{execute}}
   
   This would increase the encryption strength, since an attacker
   can't distinguish the part of the archive that is free from the
   part that has encrypted data.

3. Create a loop device for this image file:

   `losetup -f archive1.img`{{execute}}
   
   `losetup -a`{{execute}}
   
   `losetup -a | grep archive1.img`{{execute}}
   
   `lsblk`{{execute}}
   
   `lsblk | grep loop`{{execute}}
