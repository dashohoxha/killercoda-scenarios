# Test it

1. Open it in browser: 

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. Click on "Register" and at the end of the install page create a
   user account with username `user1`, password `pass1`, and email
   `user1@example.org`. (This user will also be the administrator of
   the gitea.) Then click on the button "Install Gitea".

3. From the gitea web interface create a new repository named
   `project1`:
   
   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/repo/create
   
   
4. Create a Git project on the terminal:

   `cd`{{execute}}

   `mkdir project1`{{execute}}
   
   `cd project1`{{execute}}
   
   `git init`{{execute}}
   
   `touch README.md`{{execute}}
   
   `git add README.md`{{execute}}
   
   `git status -s`{{execute}}
   
   `git config user.email "me@example.com"`{{execute}}
   
   `git config user.name "My Name"`{{execute}}
   
   `git commit -m 'first commit'`{{execute}}
   
5. Push this project to gitea:

   `git remote add origin https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/user1/project1`{{execute}}
   
   `git remote -v`{{execute}}
   
   `git push -u origin master`{{execute}}
   
   Use the username `user1` and the password `pass1`.

6. Check in browser that the project has been uploaded to Gitea:

   https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/user1/project1
