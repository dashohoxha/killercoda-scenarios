# Processes

A _process_ is a program that is being executed by the system. Linux
is a _multitasking_ system, which means that it can run many processes
at the same time. Actually, if there is only one processor, only one
process can be executed as a certain time. However the Linux kernel
can switch quickly between different processes, allowing each of them
to run for a short time, and because this happens very fast it gives
the impression that all the programs run in parallel.

A process in Linux is started by another process, so each process has
a parent and may have some children. Only the `init` process does not
have a parent because it is the first process that is started by the
kernel after it is loaded.

1. We can use the command `ps` to list processes:

   `ps`{{execute}}

   It shows only the processes associated with the current terminal
   session. TTY is short for _Teletype_ and refers to the terminal of
   the process. Each process has a PID (process ID number).

   `ps a`{{execute}}


   Shows all the processes associated with any terminal. TIME shows the
   amount of CPU time consumed by a process. STAT shows the state of
   the process, where `S` is for sleeping, `R` is for running, etc.

   `ps au`{{execute}}

   Displays also the user (the owner of the process). It also shows
   what percentage of RAM and CPU a process is using.


   `ps --help`{{execute}}

   `ps --help simple`{{execute}}

   `ps aux | less`{{execute}}

   This shows all the processes. Notice that the process number 1 is
   `/sbin/init`.
  
2. Another command for listing processes is `pstree`:

   `pstree`{{execute}}
   
   With `-p` show also the PIDs:

   `pstree -p | less`{{execute}}
   
   With a username shows only the processes of that user:

   `pstree -p bill`{{execute}}
   
   With a PID shows only the branch of processes that start at that
   process:
   
   `pstree -p 700`{{execute}}
   
3. The command `top` shows a dynamic view of the processes, which is
   refreshed periodically:
   
   `top`{{execute}}
   
   The first part of the display shows a system summary, and the
   second part shows a list of processes, with the most actives ones
   at the top (those that consume more RAM, CPU and other resources).
   
4. When we give a command in terminal, the shell starts a new process,
   and waits until that process is done, before returning the prompt.
   For example, let's start a process that takes a long time:
   
   `sleep 100`{{execute}}
   
   It is going to wait for about 100 seconds. To interrupt a command
   that is taking too long you can press **Ctrl-c**.
   
   If we append an ampersand (**&**) to the command, the shell we run
   this command in _background_. This means that it is not going to
   wait until the command is done and will return the prompt
   immediately, so that we can run other commands:
   
   `sleep 200 &`{{execute}}
   
   `ps`{{execute}}
   
   `jobs`{{execute}}
   
   A command in background is called a job. We can move one of the
   jobs in foreground with the command `fg`:
   
   `fg %1`{{execute}}
   
   If we don't give a job number as argument, it assumes the first
   job.
   
   Now that the `sleep` job is running in terminal, we can interrupt
   it with Ctrl-c.
   
   If a command is taking too long, we can also stop it with
   **Ctrl-z** and then start it in background. For example:
   
   `sleep 200`{{execute}}
   
   Now stop it with Ctrl-z. Then move it to background with `bg`:
   
   `jobs`{{execute}}
   
   `bg %1`{{execute}}
   
   `jobs`{{execute}}
   
5. We can send signals to a process with the command `kill`:

   `sleep 100 &`{{execute}}
   
   `ps`{{execute}}
   
   `kill $!`{{execute}}
   
   `ps`{{execute}}
   
   The special variable `$!` contains the PID of the last background
   process.
   
   By default, `kill` sends the signal _terminate_ (15 or TERM), which
   asks the process politely to terminate himself.
   
   The signal _interrupt_ (2 or INT) is the same signal that is sent
   by Ctrl-c. The program usually will terminate.
   
   `sleep 100 &`{{execute}}
   
   `ps`{{execute}}
   
   `kill -2 $!`{{execute}}
   
   `ps`{{execute}}

   The signal _stop_ (19 or STOP) is not delivered to the process.
   Instead the kernel pauses the process, without terminating it (same
   as Ctrl-z for a foreground process).

   `sleep 300 &`{{execute}}
   
   `jobs`{{execute}}
   
   `kill -STOP $!`{{execute}}
   
   `jobs`{{execute}}

   The signal _continue_ (18 or CONT) will restore a process after it
   has been paused with STOP.

   `kill -CONT $!`{{execute}}
   
   `jobs`{{execute}}
   
   The signal _kill_ (9 or KILL) is also not delivered to the
   process. Instead, the kernel terminates the process immediately, no
   questions asked. This is usually used as a last resort if the process
   is not responding to the other signals.

   `kill -SIGKILL $!`{{execute}}
   
   `jobs`{{execute}}
   
   There are many other signals as well:
   
   `kill -l`{{execute}}
   
6. The command `killall` can send a signal to multiple processes that
   match a given program or username:
   
   `sleep 100 &`{{execute}}
   
   `sleep 200 &`{{execute}}
   
   `sleep 300 &`{{execute}}
   
   `jobs`{{execute}}
   
   `ps`{{execute}}
   
   `killall sleep`{{execute}}
   
   `jobs`{{execute}}
   
   `ps`{{execute}}

7. If you have superuser permissions, you can also try these commands
   to shutdown or reboot the system:
   
   `halt`
   
   `poweroff`
   
   `reboot`
   
   `shutdown -h now`
   
   `shutdown -r now`
