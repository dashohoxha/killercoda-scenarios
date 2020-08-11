#!/bin/bash
set -o verbose

##### initialize git and dvc ###############################

: === $; git init
git config color.status always
git config color.ui always

: === $; dvc init -q

: === $; git status

: === $; git commit -m "Initialize DVC"


##### create and add a test file ###########################

: === $; echo 'test 1' > file.txt

: === $; dvc add file.txt

: === $; git add file.txt.dvc .gitignore

: === $; git commit -m 'Add file.txt to project'


##### add tag v1 ###########################################

: === $; git tag v1


##### change file and commit ###############################

: === $; echo 'test 2' > file.txt

: === $; dvc status

: === $; dvc commit -f file.txt.dvc

: === $; git status

: === $; git add file.txt.dvc

: === $; git commit -m 'Change file.txt'


##### add tag v2 ###########################################

: === $; git tag v2


##### change file again and commit #########################

: === $; echo 'test 3' > file.txt

: === $; dvc status

: === $; dvc commit -f file.txt.dvc

: === $; git status

: === $; git add file.txt.dvc

: === $; git commit -m 'Change file.txt again'


##### add tag v3 ###########################################

: === $; git tag v3
