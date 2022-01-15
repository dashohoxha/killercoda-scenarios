# join

The command `join`, like `paste`, adds columns to a file. However it
does it in a way that is similar to the _join_ operation in
_relational databases_. It joins data from multiple files based on a
shared key field.

1. To demonstrate `join` let's make a couple of files with a shared
   key. The first file will contain the release dates and the release
   names:
   
   `cut -f 1,1 distros-by-date.txt > distros-names.txt`{{execute}}
   
   `paste distros-dates.txt distros-name.txt > distros-key-names.txt`{{execute}}
   
   `head distros-key-names.txt`{{execute}}
   
2. The second file will contain the release dates and the version
   numbers:
   
   `cut -f 2,2 distros-by-date.txt > distros-vernums.txt`{{execute}}
   
   `paste distros-dates.txt distros-vernums.txt > distros-key-vernumes.txt`{{execute}}
   
   `head distros-key-vernumes.txt`{{execute}}

3. Both of these files have the release date as a common field. Let's
   join them:
   
   `join distros-key-names.txt distros-key-vernums.txt | head`{{execute}}

   It is important that the files must be sorted on the key field for
   `join` to work properly.

   
   
