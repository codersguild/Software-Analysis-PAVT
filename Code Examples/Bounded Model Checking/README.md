# BMC Examples

Used `esbmc` and `corral` for demonstrating `bounded model checking` on an example. 

# Running ESBMC 

- Build and install `esbmc`.
- Build and install `gcc/clang`. 

```bash
$ esbmc --input-file code.c --smt-formula-only --z3 --output code.smt2
```

We use `Z3` for verifying if the program is correct under a `loop` unroll bound.  Build and install `Z3`. 

```bash 
$ z3 -st -v:5 -smt2 code.smt2 
```
