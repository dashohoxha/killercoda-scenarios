If a distributed team needs to share the same data among its members,
a common approach is to use some kind of data storage, like those
offered by Amazon S3, Google Cloud Storage, Azure Blob Storage, IBM
Cloud Object Storage, HDFS, etc. If the data are not too big, you may
also use Google Drive, DropBox, etc. to synchronize with a single
account.

There are also free applications that can be installed on your own
server, like:
- https://min.io/
- https://nextcloud.com/

For a more comprehensive (but not ultimate) list of the available
options see https://rclone.org/#providers

However another approach is to mount a remote directory on all the
members of the team. This can be done with a network filesystem (like
NFS, SMBFS, SSHFS, etc.), or with some distributed filesystem.

In this tutorial we will see how to share data with the help of SSHFS,
which is really easy to setup and convenient. All the members of the
team (2 in our example) will mount through SSHFS the same directory
from a central server, as shown in the following diagram:

<p align="center">
<img src="/dashohoxha/courses/misc/sharing-data-with-ssh/assets/sshfs-data-sharing.png">
</p>
