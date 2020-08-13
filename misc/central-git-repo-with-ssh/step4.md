# Share code

With this setup we can collaborate and share code by using the central
Git repo as a coordinator.

1. Let's make some changes to the project, then commit and push it:

   ```
   cat << EOF >> README.md
   
   First line
   EOF
   ```{{execute}}
   
   `git status`{{execute}}
   
   `git diff`{{execute}}

   `git add .`{{execute}}
   
   `git commit -m 'Update README'`{{execute}}
   
   `git status`{{execute}}
   
   `git push`{{execute}}
      
2. Now let's switch to the first user and pull these changes:

   On terminal 2: `cd ~/project/`{{execute T2}}
   
   `git pull`{{execute}}
   
   `cat README.md`{{execute}}
   
   `git log`{{execute}}
   
3. You can try yourself to make some changes as the first user
   (current user, second terminal tab), and then pull them from the
   second user (third terminal tab).
   
