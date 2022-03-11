# Arithmetic evaluation and expansion

We have seen before `$((expression))` where _expression_ is an
arithmetic expression. It is related to the compound command `((...))`
which is used for arithmetic evaluation (truth tests). Here we will
see some more arithmetic operators and expressions.

1. By default numbers are treated as decimals (base 10). But we can
   also use octal numbers (base 8), hexadecimal numbers (base 16), etc.
   
   Decimal: `echo $((99))`{{execute}}
   
   Octal: `echo $((077))`{{execute}}
   
   Hexadecimal: `echo $((0xff))`{{execute}}
   
   Binary: `echo $((2#11))`{{execute}}

   Base 7: `echo $((7#66))`{{execute}}

2. Arithmetic operators:

   `echo $((5 + 2))`{{execute}}

   `echo $((5 - 2))`{{execute}}

   `echo $((5 * 2))`{{execute}}

   `echo $((5 ** 2))`{{execute}}

   `echo $((5 / 2))`{{execute}}

   `echo $((5 % 2))`{{execute}}
   
   An example:
   
   `vim modulo.sh`{{execute}}
   
   `./modulo.sh`{{execute}}

3. Assignment:

   `foo=`{{execute}}
   
   `echo $foo`{{execute}}
   
   `if (( foo = 5 )); then echo "It is true."; fi`{{execute}}
   
   `echo $foo`{{execute}}

   The `=` sign above makes an assignment, and this assignment is
   successful. To check for equality we can use `==`.
   
   Other assignment operators are: `+=`, `-=`, `*=`, `/=`, `%=`.
   
   There are also incremental/decremental operators: `++` and `--`
   
   `foo=1`{{execute}} `echo $((foo++))`{{execute}} `echo $foo`{{execute}}

   `foo=1`{{execute}} `echo $((++foo))`{{execute}} `echo $foo`{{execute}}

   Let's see a modified version of the `modulo.sh` example:
   
   `vim modulo2.sh`{{execute}}
   
   `diff -u modulo.sh modulo2.sh`{{execute}}

   `./modulo2.sh`{{execute}}

4. There are also some operators that work at the bit level:

   - `~` -- Negate all the bits in a number.
   - `<<` -- Shift all the bits in a number to the left.
   - `>>` -- Shift all the bits in a number to the right.
   - `&` -- Perform an AND operation on all the bits in two numbers.
   - `|` -- Perform an OR operation on all the bits in two numbers.
   - `^` -- Perform an exclusive OR operation on all the bits in two
     numbers.
	 
   That there are also corresponding assignment operators (for
   example, `<<=`) for all but bitwise negation.
   
   Let's see an example that prints the powers of 2:
   
   `for ((i=0;i<8;++i)); do echo $((1<<i)); done`{{execute}}
   
5. The compound command `((...))` supports also comparison operators:
   `==`, `!=`, `<`, `<=`, `>`, `>=`, `&&` (logical AND), `||` (logical
   OR).
   
   It also supports the ternary operator: `expr1?expr2:expr3`.  If
   expression `expr1` evaluates to be non-zero (arithmetic true), then
   `expr2`; else `expr3`.

   Logical expressions follow the rules of arithmetic logic; that is,
   expressions that evaluate as zero are considered false, while
   non-zero expressions are considered true. The `((...))` compound
   command maps the results into the shell’s normal exit codes.
   
   `if ((1)); then echo "true"; else echo "false"; fi`{{execute}}
   
   `if ((0)); then echo "true"; else echo "false"; fi`{{execute}}
   
   The ternary operator is like a compact `if/then/else` statement:
   
   `a=0`{{execute}}
   
   `((a<1?++a:--a))`{{execute}}
   
   `echo $a`{{execute}}
   
   `((a<1?++a:--a))`{{execute}}
   
   `echo $a`{{execute}}
   
   `a=$((a<1?a+1:a-1))`{{execute}}

   `echo $a`{{execute}}
   
6. Let's see a more complete example of using arithmetic operators in
   a script that produces a simple table of numbers.
   
   `vim arith-loop.sh`{{execute}}
   
   `./arith-loop.sh`{{execute}}

7. For complex arithmetics we can use `bc`, which is an arbitrary
   precision calculator.

   `bc <<< '2 + 2'`{{execute}}
   
   `echo '2 + 2' | bc`{{execute}}
   
   This example script calculates monthly loan payments:
   
   `vim loan-calc.sh`{{execute}}
   
   `./loan-calc.sh 135000 0.0775 180`{{execute}}
   
   This example calculates the monthly payment for a $135,000 loan at
   7.75 percent APR for 180 months (15 years). Notice the precision of
   the answer. This is determined by the value given to the special
   `scale` variable in the `bc` script.
   
   For more details about `bc` see:
   
   `man bc`{{execute}} or `info bc`{{execute}}
