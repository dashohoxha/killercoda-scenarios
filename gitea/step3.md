# Test it

1. Open it in browser: 

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. At the end of the setup page create a user account.


3. From the gitea web interface create a new project called
   `project1`.
   
4. Create a Git project on the terminal:

   `mkdir project1`{{execute}}
   
   `cd project1`{{execute}}
   
   `git init`{{execute}}
   
   `touch README.md`{{execute}}
   
   `add README.md`{{execute}}
   
   `git commit -m 'first commit'`{{execute}}
   
5. Push this project to gitea:

   `git remote add \ https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/project1`{{execute}}
   
   `git push -u origin mater`{{execute}}
   
   Use the username and password of the admin user that you created.
