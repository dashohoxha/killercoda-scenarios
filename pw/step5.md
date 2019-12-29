# Other topics

1. So far we have always used the `pw` commands from its shell. But we
   can also give them on the command line, without having to enter the
   shell. This might be useful in scripts.

   `pw ls -t`{{execute}}
   
   `pw show dir1/test3`{{execute}}
   
   `pw dir1/test3`{{execute}}
   
   `pw edit dir1/test4`{{execute}}
   
   `pw show dir1/test4`{{execute}}
   
   `pw rm test6`{{execute}}
   
   `pw ls -t`{{execute}}
   
   `pw -a archive2 ls -t`{{execute}}
   
2. If the name of an entry contains spaces, enclose it in quotes:

   ```
   pw -a archive2 \
      set "dir1/test 5" --multiline
   ```{{execute}}
   
   Type this and then press Ctrl+D:
   
   ```
   password
   line 2
   line 3
   ```{{execute}}
  
   ```
   pw -a archive2 \
      show "dir1/test 5"
   ```{{execute}}
   
   `pw -a archive2 ls -t`{{execute}}
   
   ```
   pw -a archive2 \
      gen "dir1/test 5" 40 \
      --no-symbols --in-place
   ```{{execute}}

   ```
   pw -a archive2 \
      show "dir1/test 5"
   ```{{execute}}
   
3. Change the passphrase of an archive:

   `pw -a archive2 set-passphrase`{{execute}}
   
   `pw pass`{{execute}}

4. We can use an asymmetric encryption for the archives (with
   public/private keys):
   
   `pw -a archive2 set-keys`{{execute}}
   
   `pw keys`{{execute}}

   `ls -al $PW_DIR`{{execute}}
   
   `cat $PW_DIR/archive1.tgz.gpg.keys`{{execute}}
   
   `cat $PW_DIR/archive2.tgz.gpg.keys`{{execute}}
   
   `pw -a archive2`{{execute}}
   
   `ls -t`{{execute}}
   
   `q`{{execute}}
   
   `pw -a archive2 ls -t`{{execute}}
   
   `pw ls -t`{{execute}}
   
   `pw ls`{{execute}}
   
   `pw show dir1/test3`{{execute}}
   
   `pw dir1/test3`{{execute}}
   
   `pw show dir1/test5`{{execute}}

   `pw rm dir1/test5`{{execute}}

   `pw show dir1/test5`{{execute}}

   `pw ls -t`{{execute}}

5. **Note:** If you copy `$PW_DIR/archive1.tgz.gpg` to another
   machine, you need to copy also `$PW_DIR/archive1.tgz.gpg.keys` and
   `$PW_DIR/.gnupg/`, which contain the key to unlock the archives.

   `ls -al $PW_DIR`{{execute}}
   
   `ls -al $PW_DIR/.gnupg/`{{execute}}
   
   ```
   gpg --homedir $PW_DIR/.gnupg \
       --list-keys
   ```{{execute}}

   `cat $PW_DIR/archive1.tgz.gpg.keys`{{execute}}
   
   `cat $PW_DIR/archive2.tgz.gpg.keys`{{execute}}
   
6. You can also use another key (not the one generated in `$PW_DIR`)
   to lock the archive. Let's generate a new GPG key and use it:
   
   ```
   gpg --quick-generate-key \
       user1@example.org
   ```{{execute}}
   
   `gpg --list-keys user1`{{execute}}
   
   `pw keys ...`{{execute}} (use the key ID of `user1`)
   
   `cat $PW_DIR/archive1.tgz.gpg.keys`{{execute}}
  
   `pw ls -t`{{execute}}

   `pw show dir1/test3`{{execute}}

   Let's try to lock the archive with the public key of someone else:
   
   `gpg --recv-key 2C618EAACEE17BD9`{{execute}}

   `gpg --list-keys`{{execute}}
   
   `pw keys 2C618EAACEE17BD9`{{execute}}
   
   **Attention:** If you lock the archive with the public key of
   someone else you will not be able to open it anymore, because you
   don't have the private key. The solution is to always include one
   of your keys in the list of keys, like this:
   
   ```
   pw -a archive2 keys \
       my-key user1-key user2-key
   ```{{execute}}
   
   This is useful when we want to share `archive2` with `user1` and
   `user2`. Each one of us will be able to view and modify the
   passwords stored on the archive, and the archive can be
   synchronized with `scp`, NextCloud, etc. If the modifications are
   not frequent, the possibility of conflicts is also small.

7. You can also switch back from asymmetric key encryption to
   passphrase encryption, if needed:
   
   `pw pass`{{execute}}

   `pw`{{execute}}
   
   `ls -t`{{execute}}
   
   `show dir1/test3`{{execute}}

   `q`{{execute}}
