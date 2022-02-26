# Shell functions

Functions can be declared in one of these two forms, which are
equivalent:

<pre>
function name {
    commands
	return
}
</pre>

<pre>
name () {
    commands
	return
}
</pre>

1. A simple example of a function is in the script `fun.sh`:

   `vim fun.sh`{{execute}}
   
   `:q!`{{execute}}
   
   `./fun.sh`{{execute}}
   
2. Inside a function we can use local variables:

   `vim local-vars.sh`{{execute}}
   
   `:q!`{{execute}}
   
   `./local-vars.sh`{{execute}}

3. Let's display some additional info on the report page, using
   functions. We would like to display info about:
   
   - System uptime and load.
   - Disk space.
   - Home space.
   
   Let's define a function for each of these:

   `vim sys_info.sh`{{execute}}
   
   `/cat`{{execute}}
   
   `O`{{execute no-newline}}
   
   ```
   report_uptime () {
       return
   }
   
   report_disk_space () {
       return
   }
   
   report_home_space () {
       return
   }
   ```{{execute}}
   
   `^ESC`{{execute ctrl-seq}} and `:w`{{execute}}
   
   Let's call these functions inside the html body:
   
   `/TIMESTAMP`{{execute}}
   
   `o`{{execute no-newline}}

   ```
   $(report_uptime)
   $(report_disk_space)
   $(report_home_space)
   ```{{execute}}

   `^ESC`{{execute ctrl-seq}} and `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}
   
4. We see that each function is replaced by an empty line and we don't
   know what is going on. Let's display some feedback from each
   function:
   
   `vim sys_info.sh`{{execute}}
   
   `/^report_uptime`{{execute}}
   
   `o`{{execute no-newline}}
   
   `echo "Function report_uptime executed."`{{execute no-newline}}

   `^ESC`{{execute ctrl-seq}}
   
   `/^report_disk_space`{{execute}}
   
   `o`{{execute no-newline}}
   
   `echo "Function report_disk_space executed."`{{execute no-newline}}

   `^ESC`{{execute ctrl-seq}}
   
   `/^report_home_space`{{execute}}
   
   `o`{{execute no-newline}}
   
   `echo "Function report_home_space executed."`{{execute no-newline}}

   `^ESC`{{execute ctrl-seq}} and `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}
   
5. Now let's provide the real data:

   `uptime`{{execute}}
   
   `df -h .`{{execute}}
   
   `du -hs $HOME`{{execute}}
   
   `vim sys_info.sh`{{execute}}
   
   `/^report_uptime`{{execute}}
   
   `jddo`{{execute no-newline}}
   
   ```
   cat <<- _EOF_
       <h2>System Uptime</h2>
	   <pre>$(uptime)</pre>
       _EOF_
   ```{{execute}}

   `^ESC`{{execute ctrl-seq}}
   
   `/^report_disk_space`{{execute}}
   
   `jddo`{{execute no-newline}}
   
   ```
   cat <<- _EOF_
       <h2>Disk Space Utilization</h2>
	   <pre>$(df -h .)</pre>
       _EOF_
   ```{{execute}}

   `^ESC`{{execute ctrl-seq}}
   
   `/^report_home_space`{{execute}}
   
   `jddo`{{execute no-newline}}
   
   ```
   cat <<- _EOF_
       <h2>Home Space Utilization</h2>
	   <pre>$(du -hs $HOME)</pre>
       _EOF_
   ```{{execute}}

   `^ESC`{{execute ctrl-seq}} and `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}
   
6. Check it in browser:

   `./sys_info.sh > sys_info.html`{{execute}}
   
   `lynx sys_info.html`{{execute}}
   
   `qy`{{execute no-newline}}
