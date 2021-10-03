#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define CALLS 10

int main(void) {
  
  int a = __VERIFIER_nondet_uint() % 100000000,
      b = __VERIFIER_nondet_uint() % 100000000;
  
  float prob = __VERIFIER_nondet_float();

  int c = 0;

  while (a <= b) {
    for (int i = 0; i < CALLS; i++) {
      unsigned char flip =
          ((float)(nondet_double() / (RAND_MAX))) >= prob ? 1 : 0;
      c += (flip == 1) ? 1 : 0;
      a = a + c;
      b = b - c;
    }
  }

  assert(a < b);
}
