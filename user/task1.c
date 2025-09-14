//task1.c

#include "kernel/types.h"
#include "user/user.h"

#define N 10

int A[N][N];
int B[N][N];
int C[N][N];

void
init_matrices(void)
{
  int i, j;
  //Simple matrices that can be computed and initialized themselves easily
  //A[i][j] = i + 1
  //B[i][j] = j + 1
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      A[i][j] = i + 1;
      B[i][j] = j + 1;
      C[i][j] = 0;
    }
  }
}

void
print_matrix(char *name, int M[N][N])
{
  int i, j;
  printf("%s:\n", name);
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      printf("%d ", M[i][j]);
    }
    printf("\n");
  }
  printf("\n");
}

int
main(void)
{
  int i, j, k;

  init_matrices();

  //For each row, create a fresh pipe, fork child, child writes row to pipe
  //parent immediately reads row and waits for child. This keeps only few fds open
  for (i = 0; i < N; i++) {
    int p[2];
    if (pipe(p) < 0) {
      printf("pipe failed for row %d\n", i);
      exit(1);
    }

    int pid = fork();
    if (pid < 0) {
      printf("fork failed\n");
      exit(1);
    }

    if (pid == 0) {
      //Child will compute row i and write it to pipe
      close(p[0]); //close read end in child
      int row[N];
      for (j = 0; j < N; j++) {
        int sum = 0;
        for (k = 0; k < N; k++) {
          sum += A[i][k] * B[k][j];
        }
        row[j] = sum;
      }
      //Write full row
      if (write(p[1], (char*)row, sizeof(row)) != sizeof(row)) {
        printf("child %d: write error\n", i);
      }
      close(p[1]);
      exit(0);
    } else {
      //Parent will read the row from pipe and then wait for the child
      close(p[1]);
      int got = read(p[0], (char*)C[i], sizeof(C[i]));
      if (got != sizeof(C[i])) {
        printf("parent: read row %d returned %d (expected %d)\n", i, got, (int)sizeof(C[i]));
      }
      close(p[0]);
      wait(0);
    }
  }

  print_matrix("Matrix A", A);
  print_matrix("Matrix B", B);
  print_matrix("Matrix C = A * B", C);

  exit(0);
}

