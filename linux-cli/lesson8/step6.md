# Editing on the fly

1. The `tr` program is used to transliterate characters:

   `echo "lowercase letters" | tr a-z A-Z`{{execute}}

   Multiple characters can be converted to a single character:
   
   `echo "lowercase letters" | tr [:lower:] A`{{execute}}

   With the option `-d` it can delete characters:
   
   `echo "lowercase letters" | tr -d e`{{execute}}
   
   With the option `-s` it can squeeze repeated characters:
   
   `echo "aaabbbccc" | tr -s ab`{{execute}}

   `echo "abcabcabc" | tr -s ab`{{execute}}

2. As another example, let's use `tr` to implement ROT13 encoding
   (where each character is moved 13 places up the alphabet):
   
   `echo "secret text" | tr a-zA-Z n-za-mN-ZA-M`{{execute}}
   
   To decode, perform the same translation a second time:
   
   `echo "frperg grkg" | tr a-zA-Z n-za-mN-ZA-M`{{execute}}
   
3. The program `sed` means _stream editor_.

   `echo "front" | sed 's/front/back/'`{{execute}}
   
   The command `s` stands for _substitute_.

   `echo "front" | sed 's_front_back_'`{{execute}}

   The character immediately after `s` becomes the delimiter.
   
   The commands in `sed` can be preceded by an address:
   
   `echo "front" | sed '1s/front/back/'`{{execute}}
   
   `echo "front" | sed '2s/front/back/'`{{execute}}
   
4. Let's try some more examples on `distros.txt`:

   `sed -n '1,5p' distros.txt`{{execute}}
   
   The option `-n` does not print lines by default, and the `p`
   command prints only the lines in the given range.

   `sed -n '/SUSE/p' distros.txt`{{execute}}
   
   Prints only the lines that match the given regular expression.
   
   `sed -n '/SUSE/!p' distros.txt`{{execute}}
   
   Prints only the lines that do not match.

5. The command `s` substitutes by default only the first occurrence on
   a matching line:
   
   `echo "aaabbbccc" | sed 's/b/B/'`{{execute}}
   
   We can append the modifier `g` (global) to replace all the
   occurrences:

   `echo "aaabbbccc" | sed 's/b/B/g'`{{execute}}
   
6. Let's change the date format from MM/DD/YYYY to YYYY-MM-DD on
   `distros.txt`:

   `sed -E 's#([0-9]{2})/([0-9]{2})/([0-9]{4})$#\3-\1-\2#' distros.txt`{{execute}}
   
   First, we are using the option `-E, --regexp-extended` because
   there are lots of special characters like `(`, `)`, `{`, `}` in the
   regular expression and escaping all of them by a `\` would make it
   really messy and unreadable.
   
   Then, we are enclosing in parentheses the parts of the regexp that
   match the month (`[0-9]{2}`), the day (`[0-9]{2}`) and the year
   (`[0-9]{4}`).
   
   The strings that are matched by a subexpression can be used in the
   replacement like this: `\n`, where `n` is the number of the
   matching subexpression (pair of parentheses).

7. It is possible to give several commands to the same `sed` program,
   like this:
   
   `echo "aaabbbccc" | sed -e 's/b/B/g' -e 's/a/A/g'`{{execute}}
   
   However, sometimes it is preferable to list these commands in a
   `sed` script file, and call this script instead. For example:
   
   ```
   cat > distros.sed <<EOF
   #sed script to produce a distro report
   
   1 i\
   \
   Linux Distribution Report\
   
   s#([0-9]{2})/([0-9]{2})/([0-9]{4})$#\3-\1-\2#
   y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
   EOF
   ```{{execute}}
   
   `cat distros.sed`{{execute}}

   `sed -E -f distros.sed distros.txt`{{execute}}
   
   The first line is a comment.
   
   Then, the `i` command inserts something before the first line.
   
   The `s` command changes the date format.
   
   Finally, the `y` command transliterates the lower case characters
   to upper case, similar to the command `tr`. However, unlike `tr`,
   it does not recognize character ranges or character classes, so we
   have to list all the letters of the alphabet.
