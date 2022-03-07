# An example

Let's try to improve the program `sys_info.sh`, that we started to
build in a previous lesson, by adding some parameters and option to
it. We want to be able to:

- Tell it to save the output to a specific file (instead of sending it
  to stdout), by using the options `-f file` or `--file file`.
- Tell it to ask interactively for a filename for saving the
  output. This option should be specified by `-i` or `--interactive`.
- Use the options `-h` or `--help` to make the program output
  information about its usage.

1. There is a small git repo on the archive `sys_info.tgz`, let's open
   it:
   
   `tar xfz sys_info.tgz`{{execute}}
   
   `cd sys_info/`{{execute}}
   
   `ls -al`{{execute}}
   
   `git log --oneline`{{execute}}
   
   `git tag`{{execute}}
   
2. Let's get first the initial version of the script (that was
   developed in a previous lesson):
   
   `git checkout -q 1.initial`{{execute}}
   
   `git status`{{execute}}
   
   `vim sysinfo.sh`{{execute}}
   
   `./sys_info.sh`{{execute}}
   
3. Let's see some modifications and improvements to it:

   Enclose in a function the last part (that generates the HTML page):
   
   `git checkout -q 2.write_html_page`{{execute}}
   
   `git diff 1.initial`{{execute}}

   Add a function that displays the usage of the program:
   
   `git checkout -q 3.usage`{{execute}}
   
   `git diff 2.write_html_page`{{execute}}
   
4. Add some code that reads the command line options:
   
   `git checkout -q 4.process_options`{{execute}}
   
   `git diff 3.usage`{{execute}}
   
   We use a `while` loop and `shift` to process all the options.
   Inside the loop we use `case` to match the option with one of those
   that are expected. If the option is `-f` (or `--file`), we
   interpret the next parameter as a filename and set it to the
   variable `filename`. If the option is `-i` (or `--interactive`), we
   set the variable `interactive` to `1` (otherwise it will remain
   empty).
   
   Notice that the actions corresponding to `-h | --help)` and `*)`
   are very similar, they display the usage and exit the program.
   However the later case is considered an error, because there is an
   unknown/unsupported option, so the usage is sent to _stderr_
   (`>&2`) and the program exits with code `1` (error).

5. If the option `-i` or (`--interactive`) is supplied, the program
   should get a file name interactively (from the keyboard). Let's see
   the code that does that:
   
   `git checkout -q 5.interactive`{{execute}}
   
   `git diff 4.process_options`{{execute}}
   
   This code is executed only if the global variable `interactive` is
   not empty. There is an infinite `while` loop that tries to read the
   name of the file into to global variable `filename`. We check that
   the given value is not empty and that such a file does not exist
   already.  If there is already such a file, we ask again whether we
   can overwrite the file or not. 
   
   We use the loop so that we can ask again for another file name if
   the given one is not suitable, and we repeat until we have a
   suitable file name (stored in the variable `filename`).

6. Now let's see the code that outputs the HTML page:

   `git checkout -q 6.output_html_page`{{execute}}
   
   `git diff 5.interactive`{{execute}}
   
   If the variable `filename` is empty, then the HTML page will be
   sent to the _stdout_, same as before. Otherwise the program will
   try to send it to the given file (using redirection). The program
   also makes sure that we can write to the file, by trying to create
   an empty file first.
   
7. Finally, let's study the latest version of the program and test it
   a few times.
   
   `git checkout master`{{execute}}
   
   `vim sys_info.sh`{{execute}}
   
   Notice that we have placed almost all the code inside a function.
   There is a function `main()` that calls some other functions, then
   these functions call some other ones, and so on.
   
   The `main()` function is called at the very end of the program,
   like this:
   
   `main "$@"`

   This makes sure that all the parameters given to the program are
   passed to the main function. The main function in turn passes all
   of them to the function `process_options`, like this:
   
   `process_options "$@"`
