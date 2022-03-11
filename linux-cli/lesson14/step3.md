# Traps. Asynchronous execution. Named pipes.

1. We know that programs can respond to signals. We can add this
   capability to our scripts too. Bash provides a mechanism for this
   purpose known as a _trap_. Let's see a simple example:
   
   `vim trap-demo.sh`{{execute}}
   
   When we press Ctrl-c while the script is running, the script will
   intercept the signal and will respond to it by running the `echo`
   command. Let's try it:
   
   `./trap-demo.sh`{{execute}}
   
   Press Ctrl-c a few times and see what happens.
   
2. It is more convenient to tell `trap` to call a function in response
   to a signal, instead of a complex command. Let's see another
   example:
   
   `vim trap-demo2.sh`{{execute}}
   
   Note the inclusion of an exit command in each of the
   signal-handling functions. Without an exit, the script would
   continue after completing the function.

   `./trap-demo2.sh`{{execute}}
   
   Press Ctrl-c.

3. Bash has a builtin command to help manage _asynchronous
   execution_. The `wait` command causes a parent script to pause
   until a specified process (i.e., the child script) finishes.
   
   This can be best explained by an example. We will need two scripts,
   a parent script, and a child script:
   
   `vim async-child.sh`{{execute}}
   
   This is a simple script that runs for 5 seconds.
   
   `vim async-parent.sh`{{execute}}
   
   From this script we launch the child script. Since we are appending
   `&` after it, the parent script will not wait for the child to
   finish executing but will continue running. Both of the scripts are
   now running in parallel. Immediately after launching the child, the
   parent uses the special variable `$!` to get the process ID (PID)
   of the child. This variable always contains the PID of the last job
   put into the background. Then, later in the parent script, we use
   the command `wait` to stop the parent from running any further,
   until the child script is finished. Let's try it:
   
   `./async-parent.sh`{{execute}}
   
   All the messages output from the parent are prefixed with `Parent:`
   and all the messages output from the child are prefixed with
   `Child:`.  This helps us understand the flow of execution.
   
4. _Named pipes_ behave like files but actually form first-in
   first-out (FIFO) buffers. As with ordinary (unnamed) pipes, data
   goes in one end and emerges out the other.

   With named pipes, it is possible to set up something like this:
   `process1 > named_pipe`, an this: `process2 < named_pipe` and it
   will behave like this: `process1 | process2`. The only difference
   is that `process1` and `process2` run in the current shell, not in
   a subshell, which makes named pipes more useful, even if they are a
   bit less convenient than using a pipe operator (`|`). 
   
   A named pipe can be created with the command `mkfifo`:
   
   `mkfifo pipe1`{{execute}}
   
   `ls -l pipe1`{{execute}}
   
   Notice that the first letter in the attributes field is "p",
   indicating that it is a named pipe.
   
   `ls -l > pipe1 &`{{execute}}
   
   `cat < pipe1`{{execute}}
   
   This is similar to:
   
   `ls -l | cat`{{execute}}
   
   However the named pipe is more flexible, because the two commands
   connected by the pipe can be executed even if different terminals.
   
   However these two examples are not the same thing:
   
   `echo "abc" | read`{{execute}}
   
   `echo $REPLY`{{execute}}
   
   `echo "abc" > pipe1 &`{{execute}}
   
   `read < pipe1`{{execute}}
   
   `echo $REPLY`{{execute}}
   
   Let's remove `pipe1`:
   
   `rm pipe1`{{execute}}

5. Another example with a named pipe:

   `mkfifo pipe1`{{execute}}

   `while true; do read line < pipe1; echo "You said: '$line'"; done &`{{execute}}
   
   `echo Hi > pipe1`{{execute}}
   
   `echo Hello > pipe1`{{execute}}
   
   `echo "The quick brown fox jumped over the lazy dog." > pipe1`{{execute}}

   `fg`{{execute}}
   
   Press Ctrl-c to stop the `while` loop.
   
   `rm pipe1`{{execute}}
