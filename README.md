# coq-misc-works

A random collection of my own Coq works

## Contents

### LF

My own solutions and extra works.

* `Maps.v`: 100% exercises completed, no extra content
* `Imp.v`: Not yet touched, will include extra theorems and automation tactics

### StackOverflow

* `fact_div.v`: A pure algebraic proof that `(a+b)!` is divisible by `a! * b!`. ([SO answer](https://stackoverflow.com/questions/55333331/coq-proof-that-factorial-n-factorial-k-factorial-n-k-is-integer/55944121#55944121))

## Instructions (if you really want to run them)

Currently, the only dependencies are within LF.
Run `make <filename>.vo` inside that folder to compile the target file and all of its dependencies.

Running on Gitpod is also supported.
