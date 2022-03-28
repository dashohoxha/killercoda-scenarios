# Examples 2

1. This is a script that calculates the Fibonacci numbers, using an
   iterative algorithm:
   
   `vim fibo.sh`{{execute}}
   
   `./fibo.sh`{{execute}}
   
   `for i in {0..10}; do ./fibo.sh $i; done`{{execute}}
   
   `./fibo.sh 100`{{execute}}

2. This is a script that solves the problem of Towers of Hanoi, using
   a recursive algorithm:

   `vim hanoi.sh`{{execute}}
   
   `./hanoi.sh <<< 0`{{execute}}

   `./hanoi.sh <<< 1`{{execute}}

   `./hanoi.sh <<< 2`{{execute}}

   `./hanoi.sh <<< 3`{{execute}}

   `./hanoi.sh <<< 4`{{execute}}

   `./hanoi.sh <<< 5`{{execute}}
