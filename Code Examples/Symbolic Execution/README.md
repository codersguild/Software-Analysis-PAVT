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

`KLEE` can be run with multiple options and arguments. Here I have shown one setting. 

```bash 
$ klee --exit-on-error \
--disable-inlining --optimize --use-cex-cache --libc=uclibc --posix-runtime \
--use-forked-solver --external-calls=all \
--max-memory-inhibit=false --max-static-fork-pct=1 \
--search=nurs:depth --search=random-path --search=nurs:covnew \
--max-sym-array-size=4096 --max-solver-time=30s --max-time=60min \
--set-ptree-dump --write-smt2s --write-kqueries code.bc
```

## Output 

Check the `klee-last` folder for testcases produced for each program path (seperate path conditions).

```bash 
KLEE: NOTE: Using POSIX model: /usr/local/lib/klee/runtime/libkleeRuntimePOSIX64_Release+Debug+Asserts.bca
KLEE: NOTE: Using klee-uclibc : /usr/local/lib/klee/runtime/klee-uclibc.bca
KLEE: output directory is "/home/zcluster55/Documents/Research/PrSymEx-Tool/klee-out-0"
KLEE: Using Z3 solver backend
KLEE: WARNING: undefined reference to function: __assert
KLEE: WARNING: executable has module level assembly (ignoring)
KLEE: WARNING ONCE: calling external: syscall(16, 0, 21505, 94266150828704) at klee/runtime/POSIX/fd.c:1007 10
KLEE: WARNING ONCE: Alignment of memory from call "malloc" is not modelled. Using alignment of 8.
KLEE: NOTE: 	KLEE State Forking. 
KLEE: NOTE: 	KLEE State Forking. 
KLEE: NOTE: 	KLEE State Forking. 

KLEE: done: total instructions = 7162
KLEE: done: completed paths = 4
KLEE: done: partially completed paths = 0
KLEE: done: generated tests = 4

...
klee-stats klee-last
--------------------------------------------------------------------------------
|      Path       |  Instrs|  Time(s)|  ICov(%)|  BCov(%)|  ICount|  TSolver(%)|
--------------------------------------------------------------------------------
|example1_klee_out|    7162|     0.12|    22.39|    10.79|    3319|       72.10|
--------------------------------------------------------------------------------

...
Paths Processed : 4
```
