# Format the archive

1. Using the `cryptsetup` command, format the drive with Linux Unified
   Key Setup (LUKS):
   
   `cryptsetup luksFormat /dev/loop0`{{execute}}
   
   LUKS stores some metadata at the beginning of the partition
   regarding the type of encryption used and the encryption key. The
   key is randomly generated but is itself encrypted using a
   passphrase that you provide. The passphrase should be at least 3
   random words.

2. Create a virtual device using `cryptsetup` that encrypts and decrypts
   all data going to and from the loop device:
   
   ```
   cryptsetup luksOpen \
       /dev/loop0 archive1
   ```{{execute}}
   
   `lsblk`{{execute}}

   `lsblk | grep crypt`{{execute}}

   `ls /dev/mapper/`{{execute}}
   
   `ls -l /dev/mapper/archive1`{{execute}}
   
3. Format the virtual device node `/dev/mapper/archive1` with ext4:

   ```
   mkfs.ext4 /dev/mapper/archive1 \
       -L archive1
   ```{{execute}}
   
   The whole ext4 filesystem that is created will be encrypted.

4. Close the virtual device:

   `cryptsetup luksClose archive1`{{execute}}
   
   `ls /dev/mapper/`{{execute}}
   
   `lsblk`{{execute}}
   
   `losetup -a`{{execute}}
   
   `losetup -d /dev/loop0`{{execute}}
   
   `losetup -a`{{execute}}
   
   `lsblk`{{execute}}
