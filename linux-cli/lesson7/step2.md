# cut

1. The command `cut` extracts a certain column (field) from the input,
   for example:
   
   `cut -f 3 distros.txt`{{execute}}
   
   `cut -f 1,3 distros.txt`{{execute}}
   
   `cut -f 1-2,3 distros.txt`{{execute}}
   
2. If we want to extract only the year, we can do it like this:
   
   `cut -f 3 distros.txt | cut -c 7-10`{{execute}}
   
   The option `-c` tell `cut` to extract from the line characters,
   instead of fields (as if each character is a field).

   `cut -f 3 distros.txt | cut -c 7-10,1-2,4-5`{{execute}}
   
3. Another way to get the year would be like this:
   
   `expand distros.txt | cut -c 23-`{{execute}}
   
   The command `expand` replaces tabs by the corresponding number of
   spaces, so that the year would always start at the position 23.

4. When working with fields, it is possible to specify a different
   field delimiter, instead of the tab. For example:
   
   `head /etc/passwd`{{execute}}
   
   `cut -d ':' -f 1 /etc/passwd | head`{{execute}}
   
   Here we extract the first field from `/etc/passwd`.
