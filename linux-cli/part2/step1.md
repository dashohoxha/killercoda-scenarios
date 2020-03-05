# Redirecting stdout and stderr

1. To redirect standard output to a file we can use the "`>`"
   redirection operator.

   `ls -l /usr/bin`{{execute}}
   
   `ls -l /usr/bin > ls-output.txt`{{execute}}
   
   `ls -l ls-output.txt`{{execute}}
   
   `less ls-output.txt`{{execute}}
   
2. Let's try the same example with a directory that does not exist:

   `ls -l /bin/usr`{{execute}}
   
   `ls -l /bin/usr > ls-output.txt`{{execute}}
   
   `ls` does not send its error messages to standard output.
   
   `ls -l ls-output.txt`{{execute}}

   The file has zero length.
   
   `less ls-output.txt`{{execute}}
   
   The redirection operator `>` has erased the previous content of the
   file. In fact, if we ever need to trucate (erase the content of) a
   file, or to create a new empty file, we can use a trick like this:
   
   `> ls-output.txt`{{execute}}
   
3. To actually append the redirected output to the existing content of
   the file, instead of overwriting it, we can use the operator
   "`>>`":
   
   `ls -l /usr/bin >> ls-output.txt`{{execute}}
   
   `ls -lh ls-output.txt`{{execute}}
   
   `ls -l /usr/bin >> ls-output.txt`{{execute}}
   
   `ls -lh ls-output.txt`{{execute}}
   
   `ls -l /usr/bin >> ls-output.txt`{{execute}}
   
   `ls -lh ls-output.txt`{{execute}}
   
   Notice that the size of the file is growing each time.
   
4. To redirect stderr we can use the operators "`2>`" and "`2>>`". In
   Linux, the standard output has the _file descriptor_ (file stream
   number) **1**, and the standard error has the _file descriptor_
   **2**. So, hopefully this syntax makes sense to you and is similar
   to that of redirecting stdout.
   
   `ls -l /bin/usr 2> ls-error.txt`{{execute}}
   
   `ls -l ls-error.txt`{{execute}}
   
   `less ls-error.txt`{{execute}}

5. We can redirect both stdout and stderr to the same file, like this:

   `ls -l /bin/usr > ls-output.txt 2>&1`{{execute}}
   
   The redirection `2>&1` redirects the file descriptor `2` (stderr)
   to the file descriptor `1` (stdout). But before that we redirected
   the stdout to `ls-output.txt`, so both stdout and stderr will be
   directed to this file.
   
   Notice that the order of the redirections is significant.  Let's
   try it like this:
   
   `ls -l /bin/usr 2>&1 >ls-output.txt`{{execute}}
   
   In this case we redirect file descriptor `2` (stderr) to file
   descriptor `1`, which is already the screen, and then we redirect
   the file descriptor `1` (stdout) to the file. So, the error
   messages will still be sent to the screen and not to the file.
   
   A shortcut for redirecting both stdout and stderr to the same file
   is using "`&>`":
   
   `ls -l /bin/usr &> ls-output.txt`{{execute}}
   
   For appending to the file we can use "`&>>`":

   `ls -l /bin/usr &>> ls-output.txt`{{execute}}
   
   `ls -lh ls-output.txt`{{execute}}
   
   `ls -l /bin/usr &>> ls-output.txt`{{execute}}
   
   `ls -lh ls-output.txt`{{execute}}

6. To throw away the output or the error messages of a command, we can
   send them to `/dev/null`:
   
   `ls -l /bin/usr 2> /dev/null`{{execute}}
