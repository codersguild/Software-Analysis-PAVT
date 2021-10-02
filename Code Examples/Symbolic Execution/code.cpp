// How to run.
// clang++-10 -I $HOME/klee/include -I include -c -emit-llvm \
// -std=c++17 -g -O0 -fPIC -fno-rtti -Xclang \
// -disable-O0-optnone $SRC_PATH/${example}.cpp

// klee --exit-on-error \
// --disable-inlining --optimize --use-cex-cache --libc=uclibc --posix-runtime \
// --use-forked-solver --external-calls=all \
// --max-memory-inhibit=false --max-static-fork-pct=1 \
// --search=nurs:depth --search=random-path --search=nurs:covnew \
// --max-sym-array-size=4096 --max-solver-time=30s --max-time=60min \
// --set-ptree-dump --write-smt2s --write-kqueries ${example}.bc

#include <assert.h>
#include <random>

int main(void)
{
  int a, b, c, d, e, alpha, delta, win, win_ones = 0, win_zeros = 0;

  // forall variable
  klee_make_symbolic(&a, sizeof(a), "a_sym");       // [0, 1]
  klee_make_symbolic(&c, sizeof(b), "c_sym");       // [1, 10]
  klee_make_symbolic(&d, sizeof(c), "d_sym");       // [0, 5]
  klee_make_symbolic(&win, sizeof(win), "win_sym"); // win == 1
  klee_make_symbolic(&b, sizeof(b), "b_sym");
  klee_make_symbolic(&e, sizeof(e), "e_sym");

  klee_assume(a >= 0 && a <= 1);
  klee_assume(c >= 1 && c <= 10);
  klee_assume(d >= 0 && d <= 5);

  if (a > b)
  {
    if (c + e < 15) // COMMENT : Tweak
    {
      klee_assume(win = 1);
      win_ones++;
    }
    else
    {
      win = 0;
      win_zeros++;
    }
  }
  else
  {
    if (d + e > 1) // COMMENT : Tweak
    {
      klee_assume(win = 1);
      win_ones++;
    }
    else
    {
      win = 0;
      win_zeros++;
    }
  }

  // assert(win == 1);
  // COMMENT : assert(P(win == 1) > 0.5);
  return 0;
}
