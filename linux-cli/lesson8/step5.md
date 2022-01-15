# Comparing text

1. Let's create two test files:

   ```
   cat > file1.txt <<EOF
   a
   b
   c
   d
   EOF
   ```{{execute}}
   
   ```
   cat > file2.txt <<EOF
   b
   c
   d
   e
   EOF
   ```{{execute}}

2. We can compare them with `comm`:

   `comm file1.txt file2.txt`{{execute}}
   
   `comm -12 file1.txt file2.txt`{{execute}}
   
   In this case we are suppressing the columns 1 and 2.
   
3. A more complex tool is `diff`:

   `diff file1.txt file2.txt`{{execute}}
   
   With context:
   
   `diff -c file1.txt file2.txt`{{execute}}
   
   Unified format is more concise:
   
   `diff -u file1.txt file2.txt`{{execute}}
   
4. To create a _patch_ file usually the options `-Naur` are used:

   `diff -Naur file1.txt file2.txt > patchfile.txt`{{execute}}
   
   `cat patchfile.txt`{{execute}}
   
   We can use the command `patch` to apply a patch file:
   
   `patch patchfile.txt`{{execute}}
   
   `cat file1.txt`{{execute}}
   
   Now `file1.txt` has the same content as `file2.txt`.
