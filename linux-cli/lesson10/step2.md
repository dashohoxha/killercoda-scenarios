# Starting a project

We will start to write a script that generates a report about various
status and statistics of the system. This report will be in the HTML
format.

1. The first step is to write a program (script) that outputs a basic
   HTML page to the standard output. An example of a basic HTML page
   is on the file `page.html`:
   
   `cat page.html`{{execute}}
   
   `lynx page.html`{{execute}}
   
   `qy`{{execute no-newline}}
   
   `mv page.html sys_info.sh`{{execute}}
   
   `vim sys_info.sh`{{execute}}
   
   `:1,$ s/^/echo "/`{{execute}}
   
   `:% s/$/"/`{{execute}}
   
   `1G`{{execute no-newline}}
   
   `O`{{execute no-newline}}
   
   ```
   #!/bin/bash
   
   # Program to output a system information page
   ```{{execute}}
   
   `^ESC`{{execute ctrl-seq}}
   
   `:wq`{{execute}}
   
   `chmod +x sys_info.sh`{{execute}}
   
   `./sys_info.sh`{{execute}}

   `./sys_info.sh > sys_info.html`{{execute}}
   
   `lynx sys_info.html`{{execute}}
   
   `qy`{{execute no-newline}}

2. We can make this script more simple and clear by using a single
   `echo`:
   
   `vim sys_info.sh`{{execute}}
   
   `:6,$ s/echo "//`{{execute}}
   
   `:5,$-1 s/"$//`{{execute}}
   
   `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}

   A quoted string may contain newlines, and therefore contain
   multiple lines of text.
   
3. Let's put some data on the report:

   `vim sys_info.sh`{{execute}}
   
   `:% s/Page Title/System Information Report/`{{execute}}

   `:% s#Page body#<h1>System Information Report</h1>#`{{execute}}

   `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}

4. We can use a variable to avoid the repetition of the text "System
   Information Report":

   `vim sys_info.sh`{{execute}}
   
   `:% s/System Information Report/$title/`{{execute}}
   
   `/echo`{{execute}}
   
   `O`{{execute no-newline}}
   
   `title="System Information Report"`{{execute}
   
   `^ESC`{{execute ctrl-seq}}
   
   `:wq`{{execute}}
   
   `./sys_info.sh`{{execute}}
