# Text processing: paste

1. The `paste` command does the opposite of `cut`. Rather than
   extracting a column of text from a file, it adds one or more
   columns of text to a file.
   
   To demonstrate how `paste` operates, we will perform some surgery
   on our `distros.txt` file to produce a chronological list of
   releases.
   
   First let's sort distros by date:
   
   `head distros.txt`{{execute}}
   
   ```
   sort -k 3.7nbr -k 3.1nbr -k 3.4nbr \
       distros.txt > distros-by-date.txt
   ```{{execute}}
   
   `head distros-by-date.txt`{{execute}}
   
   Next, let's use `cut` to extract the first two fields/columns from
   the file (the distro name and version):
   
   `cut -f 1,2 distros-by-date.txt > distros-versions.txt`{{execute}}

   `head distros-versions.txt`{{execute}}
   
   Let's extract also the release dates:
   
   `cut -f 1,2 distros-by-date.txt > distros-dates.txt`{{execute}}

   `head distros-dates.txt`{{execute}}
   
   To complete the process, let's use `paste` to put the column of
   dates ahead of distro names and versions, thus creating a
   chronological list:
   
   ```
   paste distros-dates.txt distros-versions.txt \
       > distros-chronological.txt
   ```{{execute}}

   `head distros-chronological.txt`{{execute}}
   
2. 
