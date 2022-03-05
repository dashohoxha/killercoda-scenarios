# Examples

1. Let's see an example program that validates its input:

   `vim validate.sh`{{execute}}
   
   `:q!`{{execute}}
   
   Try if a few times with different inputs:
   
   `./validate.sh`{{execute}}


2. Let's see a menu driven example program:

   `vim menu.sh`{{execute}}
   
   Notice the use of the `exit` command in this script. It is used
   here to prevent the script from executing unnecessary code after an
   action has been carried out.
   
   `:q!`{{execute}}
   
   Try if a few times.

3. As an exercise, try to modify these examples so that instead of
   `[[... ]]` and `((...)`, they use the command `test`.
   
   _Hint:_ Use grep to evaluate the regular expressions and evaluate
   the exit status.
