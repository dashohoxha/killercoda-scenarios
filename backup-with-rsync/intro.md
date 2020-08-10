In this tutorial we will see how to backup a server with `rsync`.  It
is the first approach that comes to mind for making a server backup,
however making it in a safe and secure way needs a couple of "tricks".
Safe means that the user who makes the backup can only get the backup
data from the server, but cannot push (or restore) it, and cannot
change or do anything else on the server.
