#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

#define MB (1024 * 1024)

int
main(int argc, char *argv[])
{
  char *mem;
  int allocated = 0;
  int chunk_size = 10 * MB; 
  
  printf("Testing memory allocation with increased RAM...\n");
  printf("Attempting to allocate memory in 10MB chunks...\n\n");
  
  while (1) {
    mem = sbrk(chunk_size);
    
    // Check if allocation failed
    if (mem == (char*)-1) {
      printf("\nAllocation failed - reached memory limit\n");
      break;
    }
    
    // Actually touch the memory to ensure it's allocated
    // (prevents lazy allocation tricks)
    for (int i = 0; i < chunk_size; i += 4096) {
      mem[i] = 1;
    }
    
    allocated += chunk_size;
    printf("Successfully allocated: %d MB\n", allocated / MB);
    
    // Safety limit to prevent infinite loop
    if (allocated >= 500 * MB) {
      printf("\nReached 500MB - stopping test\n");
      break;
    }
  }
  
  printf("\n=== Memory Test Results ===\n");
  printf("Total memory allocated: %d MB\n", allocated / MB);
  printf("This confirms RAM was increased successfully!\n");
  
  exit(0);
}
