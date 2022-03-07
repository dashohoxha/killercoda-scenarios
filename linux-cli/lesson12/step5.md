# Testing the example

1. Let's see the usage of the program:
   
   `./sys_info.sh -h`{{execute}}

   `./sys_info.sh --help`{{execute}}

2.  We see that we can also call it without any parameters. Let's try
   it:
   
   `./sys_info.sh`{{execute}}

   `./sys_info.sh > report1.html`{{execute}}
   
   `lynx report1.html`{{execute}}
   
   `qy`{{execute}}
   
3. We can write the output to a file using the option `-f` or
   `--file`:
   
   `./sys_info.sh -f report2.html`{{execute}}
   
   `cat report2.html`{{execute}}

   `./sys_info.sh --file report3.html`{{execute}}

4. Let's also try the interactive method:

   `./sys_info.sh -i`{{execute}}
   
   `report1.html`{{execute}}
   
   `n`{{execute}}
   
   `report2.html`{{execute}}
   
   `y`{{execute}}

   `./sys_info.sh --interactive`{{execute}}
   
   `report3.html`{{execute}}
   
   `n`{{execute}}
   
   `report4.html`{{execute}}

   `lynx report4.html`{{execute}}
   
   `qy`{{execute}}
