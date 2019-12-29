# Archives
      
1. With the option `-a` we can select the archive of the passwords:

   `pw -a archive1`{{execute}}
   
   `ls`{{execute}}
   
   `q`{{execute}}
   
   `ls -al ~/.pw/`{{execute}}
   
   `rm ~/.pw/archive1.tgz.gpg`{{execute}}
   
   ```
   mv ~/.pw/pw.tgz.gpg \
      ~/.pw/archive1.tgz.gpg
   ```{{execute}}

   `ls -al ~/.pw/`{{execute}}
   
   `pw -a archive1`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
   `pw`{{execute}}
   
   `ls`{{execute}}
   
   `q`{{execute}}
   
   `rm -f ~/.pw/pw.tgz.gpg`{{execute}}
   
2. We can set the default archive of `pw` on `config.sh`:

   `cat ~/.pw/config.sh | grep ARCHIVE`{{execute}}
   
   ```
   sed -i ~/.pw/config.sh \
       -e '/^DEFAULT_ARCHIVE=/ c DEFAULT_ARCHIVE=archive1'
   ```{{execute}}
   
   `cat ~/.pw/config.sh | grep ARCHIVE`{{execute}}
   
   `pw`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
3. We can set the directory of `pw` on the environment variable
   `PW_DIR`:

   `mv ~/.pw ~/.passw`{{execute}}
   
   `pw`{{execute}}
   
   `ls`{{execute}}
   
   `q`{{execute}}
   
   `rm -rf ~/.pw/`{{execute}}
   
   `PW_DIR=~/.passw pw`{{execute}}

   `ls -t`{{execute}}
   
   `q`{{execute}}
   
   ```
   echo 'export PW_DIR=~/.passw' \
       >> ~/.bashrc
   ```{{execute}}
   
   `source ~/.bashrc`{{execute}}
   
   `echo $PW_DIR`{{execute}}
   
   `pw`{{execute}}

   `ls -t`{{execute}}
   
   `q`{{execute}}
   
4. The password archive is just a zipped and encrypted
   directory. Let's inspect it:
   
   `gpg ~/.passw/archive1.tgz.gpg`{{execute}}

   `ls -al ~/.passw/`{{execute}}
   
   `mkdir tmp`{{execute}}
   
   `tar xzf ~/.passw/archive1.tgz -C tmp/`{{execute}}
   
   `tree tmp/`{{execute}}
   
   `cd tmp/`{{execute}}
   
   `cat test2`{{execute}}
   
   `cat dir1/test3`{{execute}}
   
   `git log --oneline`{{execute}}
   
   `cd ..`{{execute}}
   
   `rm -rf tmp/`{{execute}}
   
   `ls -al ~/.passw/`{{execute}}
   
   `rm ~/.passw/archive1.tgz`{{execute}}

5. The same thing that we did above can also be done with the command
   `pw export`:
   
   `mkdir tmp`{{execute}}
   
   `pw export tmp/`{{execute}}
   
   `ls -al tmp/`{{execute}}
   
   `tree tmp/`{{execute}}
   
   We can also import a directory to an archive:
   
   `rm tmp/dir1/test5`{{execute}}
   
   `rm tmp/test2`{{execute}}
   
   `tree tmp/`{{execute}}
   
   `pw -a archive2 import tmp/`{{execute}}
   
   `ls -al $PW_DIR`{{execute}}
   
   `pw -a archive2`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
   We can import a directory to an existing archive too, in which case
   the new entries will overwrite the existing ones:
   
   `echo TEST5 > tmp/test5`{{execute}}
   
   `echo TEST6 > tmp/test6`{{execute}}
   
   `pw import tmp/`{{execute}}
   
   `pw`{{execute}}
   
   `ls -t`{{execute}}
   
   `show test5`{{execute}}
   
   `show test6`{{execute}}

   `q`{{execute}}
