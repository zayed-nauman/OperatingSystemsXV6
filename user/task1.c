#include "kernel/types.h"
#include "user/user.h"

int main() {
  printf("Cycles: %ld\n", rdcycles());
  printf("Time: %ld\n", rdtime());
  printf("Instructions Retired: %ld\n", rdinstret());
  exit(0);
}

