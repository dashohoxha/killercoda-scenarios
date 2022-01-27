# Filesystems

## 1. Create a virtual block device

Linux supports a special block device called the loop device, which
maps a normal file onto a virtual block device. This allows for the
file to be used as a "virtual file system".

1. Create a file of size 1G:

   `fallocate -l 1G disk.img`{{execute}}

   `du -hs disk.img`{{execute}}

2. Create a loop device with this file:

   `losetup -f disk.img`{{execute}}

   The option `-f` finds an unused loop device.

3. Find the name of the loop device that was created:

   `losetup -a`{{execute}}
   
   `losetup -a | grep disk.img`{{execute}}

## 2. Create an XFS filesystem

1. Make sure that the package `xfsprogs` is installed:

   `apt install xfsprogs`{{execute}}

2. Create an XFS filesystem on the image file:

   `mkfs.xfs -m reflink=1 -L test disk.img`{{execute}}

   The metadata `-m reflink=1` tells the command to enable reflinks,
   and `-L test` sets the label of the filesystem.

3. Create a directory:

   `mkdir mnt`{{execute}}

4. Mount the loop device on it:

   `mount /dev/loop0 mnt`{{execute}}
   
   `mount`{{execute}}

5. Check the usage of the filesystem:

   `df -h mnt/`{{execute}}

   Notice that only **40M** are used from it.


## 3. Copy files with '--reflink'

1. Create for testing a file of size 100 MB (with random data):

   `cd mnt/`{{execute}}
   
   `dd if=/dev/urandom of=test bs=1M count=100`{{execute}}

2. Check that now there are **140M** of disk space used:

   `df -h .`{{execute}}

3. Create a copy of the file (with reflinks enabled):

   `cp -v --reflink=always test test1`{{execute}}

4. Check the size of each file:

   `ls -hsl`{{execute}}

    Each of them is **100M** and in total there are **200M** of data.

5. However if we check the disk usage we will see that both of them
   still take on disk the same amout of space as before **140M**:

   `df -h .`{{execute}}

This shows the space-saving feature of reflinks. If the file was big
enough, we would have noticed as well that the reflink copy takes no
time at all, it is done instantly.

## 4. Clean up

1. Unmount and delete the test directory `mnt/`:

   `
   cd ..
   umount mnt/
   rmdir mnt/
   `{{execute}}

2. Delete the loop device:

   `
   losetup -a
   losetup -d /dev/loop0
   `{{execute}}

3. Remove the file that was used to create the loop device:

   `rm disk.img`{{execute}}
