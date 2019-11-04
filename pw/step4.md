# Working with archives
      
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
       -e '/^ARCHIVE=/ c ARCHIVE=archive1'
   ```{{execute}}
   
   `cat ~/.pw/config.sh | grep ARCHIVE`{{execute}}
   
   `pw`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
3. We can set the directory of `pw` on the environment variable
   `PW_DIR`:

   `mv ~/.pw ~/.passw`{{execute}}
   
   `pw`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
   `rm -rf ~/.pw/`
   
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
   
   `ls -al tmp/`{{execute}}
   
   `cd tmp/`{{execute}}
   
   `cat test`{{execute}}
   
   `cat test2`{{execute}}
   
   `git status --oneline`{{execute}}
   
   `cd ..`{{execute}}
   
   `rm -rf tmp/`{{execute}}
   
   `ls -al ~/.passw/`{{execute}}
   
   `rm ~/.passw/archive1.tgz`{{execute}}

5. Export and import archives
