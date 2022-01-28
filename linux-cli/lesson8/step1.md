# Archiving and backup

1. We can use use `gzip` and `bzip2` to compress one or more files:

   `ls -l /etc > foo.txt`{{execute}}
   
   `ls -lh foo.*`{{execute}}
   
   `gzip foo.txt`{{execute}}
   
   `ls -lh foo.*`{{execute}}
   
   `gunzip foo.txt`{{execute}}

   `ls -lh foo.*`{{execute}}
   
   `ls -l /etc | gzip > foo.txt.gz`{{execute}}
   
   `gunzip -c foo.txt.gz`{{execute}}
   
   `zcat foo.txt.gz | less`{{execute}}
   
   `zless foo.txt.gz`{{execute}}
   
   `bzip2 foo.txt`{{execute}}
   
   `ls -lh foo.*`{{execute}}
   
   `bunzip2 foo.txt.bz2`{{execute}}

   `ls -lh foo.*`{{execute}}
   
2. We can use `tar` to archive files.

   Let's create a test directory:

   `mkdir -p testdir/dir-{001..100}`{{execute}}
   
   `touch testdir/dir-{001..100}/file-{A..Z}`{{execute}}
   
   `ls testdir/`{{execute}}
   
   `ls testdir/dir-001/`{{execute}}
   
   Create a tar archive of the entire directory:
   
   `tar -c -f testdir.tar testdir`{{execute}}
   
   `tar -cf testdir.tar testdir`{{execute}}
   
   `ls -lh`{{execute}}
   
   The option `-c` means `create`, and the option `-f` is for the
   filename of the archive.
   
   The option `-t` is used to list the contents of the archive, and
   `-v` is for verbose:
   
   `tar -tf testdir.tar | less`{{execute}}

   `tar -tvf testdir.tar | less`{{execute}}
   
   Now let's extract the archive in a new location:
   
   `mkdir foo`{{execute}}
   
   `cd foo`{{execute}}
   
   `tar -xf ../testdir.tar`{{execute}}
   
   `ls`{{execute}}
   
   `tree -C | less -r`{{execute}}
   
   `cd .. ; rm -rf foo/`{{execute}}
   
3. By default, `tar` removes the leading `/` from absolute filenames:

   `echo $(pwd)/testdir`{{execute}}

   `tar cf testdir2.tar $(pwd)/testdir`{{execute}}

   `tar tf testdir2.tar | less`{{execute}}
   
   `mkdir foo`{{execute}}
   
   `tar xf testdir2.tar -C foo/`{{execute}}
   
   `tree foo -C | less -r`{{execute}}
   
   `rm -rf foo`{{execute}}

4. We can extract only some files from the archive (not all the
   files):
   
   `mkdir foo`{{execute}}
   
   `cd foo`{{execute}}

   `tar tf ../testdir.tar testdir/dir-001/file-A`{{execute}}

   `tar xf ../testdir.tar testdir/dir-001/file-A`{{execute}}
   
   `tree`{{execute}}

   `tar xf ../testdir.tar testdir/dir-002/file-{A,B,C}`{{execute}}
   
   `tree`{{execute}}

   We can also use `--wildcards`, like this:
   
   `tar xf ../testdir.tar --wildcards 'testdir/dir-*/file-A'`{{execute}}
   
   `tree -C | less -r`{{execute}}
   
   `cd .. ; rm -rf foo`{{execute}}

5. Sometimes it is useful to combine `tar` with `find` and `gzip`:

   `find testdir -name 'file-A'`{{execute}}
   
   `find testdir -name 'file-A' -exec tar rf testdir3.tar '{}' '+'`{{execute}}
   
   `tar tf testdir3.tar | less`{{execute}}
   
   `find testdir -name 'file-B' -exec tar rf testdir3.tar '{}' '+'`{{execute}}
   
   `tar tf testdir3.tar | less`{{execute}}
   
   The option 'r' is for appending files to an archive.
   
   `find testdir -name 'file-A' | tar cf - -T - | gzip > testdir.tgz`{{execute}}
   
   The first `-` makes tar to send the output to _stdout_ instead of a
   file. The option `-T` or `--files-from` includes in the archive
   only the files listed in the given file. In this case we are
   reading the list of files from `-`, which means the _stdin_ and is
   the list of files coming from the command `find`. Then we are
   passing the output of `tar` to `gzip` in order to compress it.

   We can also use the options `z` or `j` to compress the archive:
   
   `find testdir -name 'file-A' | tar czf testdir.tgz -T -`{{execute}}
   
   `find testdir -name 'file-A' | tar cjf testdir.tbz -T -`{{execute}}
   
   `ls -lh`{{execute}}
   
   The option `j` uses `bzip2` compression, instead of `bzip`.

6. The `zip` program is both a compression tool and an achiever:

   `zip -r testdir.zip testdir`{{execute}}
   
   `ls -lh`{{execute}}
   
   The option `-r` is for recursion.
   
   `mkdir -p foo`{{execute}}
   
   `cd foo`{{execute}}
   
   `unzip ../testdir.zip`{{execute}}
   
   `tree | less`{{execute}}
   
   `unzip -l ../testdir.zip testdir/dir-007/file-*`{{execute}}

   `unzip ../testdir.zip testdir/dir-007/file-*`{{execute}}
   
   `cd .. ; rm -rf foo`{{execute}}
   
7. We can use `rsync` to synchronize files and directories:

   `rsync -av testdir foo`{{execute}}
   
   `ls foo`{{execute}}
   
   `rsync -av testdir foo`{{execute}}
   
   Notice that in the second case no files are copied because `rsync`
   detects that there are no differences between the source and the
   destination.
   
   `touch testdir/dir-099/file-Z`{{execute}}

   `rsync -av testdir foo`{{execute}}

   With the option `--delete` we can also delete the files on the
   destination directory that are not present on the source directory.

   `rm testdir/dir-099/file-Z`{{execute}}

   `rsync -av testdir foo`{{execute}}
   
   `ls foo/testdir/dir-099/file-Z`{{execute}}
   
   `rsync -av --delete testdir foo`{{execute}}
   
   `ls foo/testdir/dir-099/file-Z`{{execute}}
   
   `rsync` can be used over the network as well, usually combined with
   `ssh`.
   
