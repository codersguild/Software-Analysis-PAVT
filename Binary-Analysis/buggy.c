#include <stdio.h>
#include <unistd.h>
#include <assert.h>

// https://blog.grimm-co.com/2020/05/guided-fuzzing-with-driller.html
int main(int argc, char *argv[]) {
  char buffer[6] = {0};
  int i;
  int *null = 0;

  read(0, buffer, 6);
  if (buffer[0] == '7' && buffer[1] == '/' && buffer[2] == '4'
      && buffer[3] == '2' && buffer[4] == 'a' && buffer[5] == '8') {
    i = *null;
    assert(0);
  }

  puts("No problem");
  return 0;
}
