# Automatic synchronization between DVC and Git

In the previous steps we saw that whenever we make a `git checkout`,
we also need to make a `dvc checkout`, in order to get the correct
version of the data that corresponds to the current Git version.

It is possible to automate this step by using Git hooks. The command
`dvc install` installs such hooks. Let's give it a try.

1. First let's quickly create a workspace with several versions:

   `cd`{{execute}}
   
   `rm -rf proj1/`{{execute}}
   
   `mkdir proj1/`{{execute}}
   
   `cd proj1`{{execute}}
   
   `play init-git-repo.sh`{{execute}}
   
   `ls -al`{{execute}}
   
   Currently we have three versions of `file.txt` on the DVC cache,
   and three versions of `file.txt.dvc` on Git, each of them marked
   with a tag:
   
   `tree -a -I .git`{{execute}}
   
   `git log file.txt.dvc`{{execute}}
   
   `git tag`{{execute}}
   
2. Now let's install the git hooks and try to switch to different
   versions:
   
   `dvc install`{{execute}}
   
   `cat file.txt`{{execute}}
   
   Go to `v2`:
   
   `git checkout v2`{{execute}}
   
   `git status`{{execute}}
   
   `cat file.txt`{{execute}}
   
   Go to `v1`:
   
   `git checkout v1`{{execute}}
   
   `git status`{{execute}}
   
   `cat file.txt`{{execute}}
   
   Go to the latest version:
   
   `git checkout master`{{execute}}
   
   `git status`{{execute}}
   
   `cat file.txt`{{execute}}
   
   As you see, now we don't have to remember to run `dvc checkout`
   each time that we make a `git checkout`.
   
