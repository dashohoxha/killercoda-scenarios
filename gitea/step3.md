# Test it

1. Open it in browser: 

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/
   
2. The scripts have created automatically an admin user `username`
   with password `123456`. Click on `Sign In` and login as this user.

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

   ```
   git remote add origin \
       https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/username/project1
   ```{{execute}}
   
   **Note:** Change `username` to the value that you set to
   `ADMIN_USER` on `settings.sh`.
   
   `git remote -v`{{execute}}
   
   `git push -u origin master`{{execute}}
   
   Use the username `username` and the password `123456` (if you did
   not change them).

6. Check in browser that the project has been uploaded to Gitea:

   https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/username/project1
