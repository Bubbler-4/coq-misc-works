# coq-misc-works

A random collection of my own Coq works

## Contents

### LF

My own solutions and extra works.

* `Maps.v`: 100% exercises completed, no extra content
* `Imp.v`: 20% completed, will include extra theorems and automation tactics
  * Optional exercise `optimize`
    * Two implementations of constant folding (fold once / fold fully)
    * Proofs that both are sound, and full folding yields a constant (because there's no variables here)

### StackOverflow

* `fact_div.v`: A pure algebraic proof that `(a+b)!` is divisible by `a! * b!`. ([SO answer](https://stackoverflow.com/questions/55333331/coq-proof-that-factorial-n-factorial-k-factorial-n-k-is-integer/55944121#55944121))

### Planned Contents

* The entire book of PLF, probably with my own set of automated tactics.
* Solutions to [MIT FRAP '18 exercises](https://github.com/mit-frap/spring18). Probably will do '17 and '16 too.
  I'm not sure whether it will work with default stdlib without the FRAP library, but I'll try. Quick skim indicates that most of the exercises are independent of FRAP.
* More StackOverflow answers.

## Instructions (if you really want to run them)

Currently, the only dependencies are within LF.
Run `make <filename>.vo` inside that folder to compile the target file and all of its dependencies.

Running on Gitpod is also supported, and you can actually run CoqIDE online through the VNC server.
For native Gitpod support (no VNC), we should wait until at least three things come to life
(AFAIK all of these are planned, but progress is unknown):

* Coq speaks LSP,
* a working VS Code plugin is available using the LSP,
* and Gitpod supports arbitrary VS Code plugins.
