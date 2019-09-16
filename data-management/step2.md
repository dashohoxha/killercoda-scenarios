# Initialize a DVC project

1. Create a project directory:

   `mkdir proj1`{{execute}}
   
2. Initialize DVC:

  `cd proj1`{{execute}}
  
  `dvc init --no-scm`{{execute}}
  
  With the option `--no-scm` we are telling it that we are not going
  to use it togather with GIT.
  
3. Check the `.dvc` directory that was created:

  `tree -aF`{{execute}}
