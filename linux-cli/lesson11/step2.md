# More testing constructions

1. Modern versions of bash include a compound command that acts as an
   enhanced replacement for test: `[[ expression ]]` . It has also an
   operator for regular expression matching: `=~`.

   `vim test-integer2.sh`{{execute}}

   `./test-integer2.sh`{{execute}}
   
   Another added feature of `[[ ]]` is that the `==` operator supports
   pattern matching the same way pathname expansion does:
   
   `FILE=foo.bar`{{execute}}
   
   `if [[ $FILE == foo.* ]]; then echo "$FILE matches pattern 'foo.*'"; fi`{{execute}}
   
2. In addition to the `[[ ]]` compound command, bash also provides the
   `(( ))` compound command, which is useful for operating on integers.
   
   `if ((1)); then echo "It is true."; fi`{{execute}}
   
   `if ((0)); then echo "It is true."; fi`{{execute}}

   `if ((2)); then echo "It is true."; fi`{{execute}}
   
   With this test command we can simplify a bit the previous example
   script:
   
   `vim test-integer2a.sh`{{execute}}

   `./test-integer2a.sh`{{execute}}
   
   `diff -u test-integer2.sh test-integer2a.sh | highlight -S bash -O xterm256 2>/dev/null`{{execute}}
   
   Notice that we don't use a `$` sign to refer to variables inside
   `(( ))`. Also, instead of `-eq` we use the operator `==`, instead
   of `-lt` we use `<`, etc. This makes the syntax a bit more natural.

3. We can use logical operators to create complex expressions. For the
   `test` (and `[ ]`) command the logical operators are `-a` (AND),
   `-o` (OR) and `!` (NOT). For the commands `[[ ]]` and `(( ))` they
   are: `&&`, `||` and `!`.

   `vim test-integer3.sh`{{execute}}

   `./test-integer3.sh`{{execute}}
   
   The option `-n` of the command `echo` tells it to not print a
   newline after the string.
   
   Notice that because `test` and `[` are treated as commands (unlike
   `[[` and `((` which are special shell constructs), each argument
   given to them has to be separated by a space. Also, the parentheses
   that group logical expressions have to be escaped like this: `\(`
   and `\)`, otherwise shell will interpret them as something else
   (they have a special meaning in shell).
   
   Usually it is more convenient to use `[[` instead of `test` or `[`.
   
4. We can use the operators `&&` (AND) and `||` (OR) for conditional
   execution of a command. They can be used like this:
   
   `command1 && command2`
   
   First is executed `command1`. If (and only if) it is successful,
   the `command2` is executed as well.
   
   `command1 || command2`
   
   First is executed `command1`. If (and only if) it fails, the
   `command2` is executed as well.
   
   For example:
   
   `mkdir temp && cd temp`{{execute}}
   
   `[[ -d temp ]] || mkdir temp`{{execute}}

   The first one is equivalent to:
   
   `if test mkdir temp; then cd temp; fi`{{execute}}
   
   The second one is equivalent to:
   
   `if [[ -d temp ]]; then : ; else mkdir temp; fi`{{execute}}
   
   The command `:` is a null command, which means "do
   nothing". Without it we would get a syntax error.
