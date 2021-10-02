# Running the example

- Install Clang.
- Install KLEE.

## Compile

Compile the example with `clang`. 

```bash
$ clang++-10 -I $HOME/klee/include -I include -c -emit-llvm \
-std=c++17 -g -O0 -fPIC -fno-rtti -Xclang \
-disable-O0-optnone code.cpp
```

## Running KLEE

`KLEE` can be run with multiple options and arguments. Here I have shown one example. 

```bash 
$ klee --exit-on-error \
--disable-inlining --optimize --use-cex-cache --libc=uclibc --posix-runtime \
--use-forked-solver --external-calls=all \
--max-memory-inhibit=false --max-static-fork-pct=1 \
--search=nurs:depth --search=random-path --search=nurs:covnew \
--max-sym-array-size=4096 --max-solver-time=30s --max-time=60min \
--set-ptree-dump --write-smt2s --write-kqueries code.bc
```
