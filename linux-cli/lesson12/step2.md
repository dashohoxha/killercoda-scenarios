# Branching with case

The command `case` is a multiple-choice command.

1. Let's see an example that implements a menu program with `case`:

   `vim case-menu.sh`{{execute}}
   
   We have seen this example before, implemented with `if` and it is
   clear that with `case` it is much simpler.
   
   `./case-menu.sh`{{execute}}

   `case` attempts a match against the specified patterns. When a
   match is found, the commands associated with the specified pattern
   are executed.  After a match is found, no further matches are
   attempted.
   
2. The patterns used by case are the same as those used by pathname
   expansion. For example:
   
   - `a)` -- matches the character "a"
   - `[[:alpha:]])` -- matches any alphabetic character
   - `???)` -- matches 3 characters
   - `*.txt)` -- matches anything that ends in `.txt`
   - `*)` -- matches anything
   
   It is good practice to include `*)` as the last pattern in a `case`
   command, to catch any values that did not match a previous pattern.
   
   Let's see an example script with patterns:
   
   `vim case-patterns.sh`{{execute}}
   
   `./case-patterns.sh`{{execute}} `x`{{execute}}

   `./case-patterns.sh`{{execute}} `B2`{{execute}}

   `./case-patterns.sh`{{execute}} `foo.txt`{{execute}}

   `./case-patterns.sh`{{execute}} `xyz`{{execute}}

   `./case-patterns.sh`{{execute}} `ab`{{execute}}

3. It is also possible to combine multiple patterns using the vertical
   bar character as a separator. Let's see a modified menu program
   that uses letters instead of digits for menu selection:

   `vim case-menu-l.sh`{{execute}}
   
   Notice how the new patterns allow for entry of both uppercase and
   lowercase letters.
   
   `./case-menu-l.sh`{{execute}}

4. When a pattern is matched, the corresponding actions are executed,
   and `;;` makes sure that processing is stopped (without trying to
   match the following patterns). If we want instead to try matching
   them as well, we can use `;;&` instead, as in this example:

   `vim case4.sh`{{execute}}
   
   `./case4.sh`{{execute}} `a`{{execute}}

   `./case4.sh`{{execute}} `X`{{execute}}

   `./case4.sh`{{execute}} `+`{{execute}}
