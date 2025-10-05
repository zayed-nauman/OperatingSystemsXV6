#include "kernel/types.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"
#include "user/user.h"

#define MAX_SIZE 512

// Dynamically allocate matrix using sbrk
int** allocate_matrix(int size) {
    int **matrix = (int**)sbrk(size * sizeof(int*));
    if (matrix == (int**)-1) {
        printf("Failed to allocate matrix row pointers\n");
        return 0;
    }
    
    for (int i = 0; i < size; i++) {
        matrix[i] = (int*)sbrk(size * sizeof(int));
        if (matrix[i] == (int*)-1) {
            printf("Failed to allocate matrix row %d\n", i);
            return 0;
        }
    }
    return matrix;
}

// Initialize matrix with simple values
void init_matrix(int **matrix, int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            matrix[i][j] = (i + j) % 100;
        }
    }
}

// Standard matrix multiplication: C = A × B
void matrix_multiply(int **A, int **B, int **C, int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            C[i][j] = 0;
            for (int k = 0; k < size; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

// Verify result (just for checking a few elements)
void verify_result(int **C, int size) {
    printf("  Sample results: C[0][0]=%d, C[%d][%d]=%d\n", 
           C[0][0], size/2, size/2, C[size/2][size/2]);
}

// Simple function to write a string to file
void write_str(int fd, char *str) {
    write(fd, str, strlen(str));
}

// Write an integer to file
void write_int(int fd, int val) {
    char buf[20];
    int i = 0;
    int is_negative = 0;
    
    if (val < 0) {
        is_negative = 1;
        val = -val;
    }
    
    if (val == 0) {
        write(fd, "0", 1);
        return;
    }
    
    while (val > 0) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    
    if (is_negative) {
        buf[i++] = '-';
    }
    
    // Reverse and write
    for (int j = i - 1; j >= 0; j--) {
        write(fd, &buf[j], 1);
    }
}

// Write a uint64 to file
void write_uint64(int fd, uint64 val) {
    char buf[30];
    int i = 0;
    
    if (val == 0) {
        write(fd, "0", 1);
        return;
    }
    
    while (val > 0) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    
    // Reverse and write
    for (int j = i - 1; j >= 0; j--) {
        write(fd, &buf[j], 1);
    }
}

// Write benchmark results to file
void save_results(int fd, int size, uint64 cycles, uint64 time, uint64 instructions) {
    uint64 operations = (uint64)size * size * (2 * size - 1);
    
    write_int(fd, size);
    write_str(fd, ",");
    write_uint64(fd, cycles);
    write_str(fd, ",");
    write_uint64(fd, time);
    write_str(fd, ",");
    write_uint64(fd, instructions);
    write_str(fd, ",");
    write_uint64(fd, operations);
    write_str(fd, "\n");
}

// Run benchmark for a specific matrix size
void benchmark_size(int size, int fd) {
    printf("\n========================================\n");
    printf("Matrix Size: %d x %d\n", size, size);
    uint64 mem_kb = (3 * (uint64)size * size * sizeof(int)) / 1024;
    printf("Memory required: ~%ld KB\n", mem_kb);
    printf("========================================\n");
    
    // Allocate matrices
    printf("Allocating matrices...\n");
    int **A = allocate_matrix(size);
    int **B = allocate_matrix(size);
    int **C = allocate_matrix(size);
    
    if (!A || !B || !C) {
        printf("FAILED: Could not allocate matrices for size %d\n", size);
        return;
    }
    
    // Initialize matrices
    printf("Initializing matrices...\n");
    init_matrix(A, size);
    init_matrix(B, size);
    
    // Measure performance
    printf("Starting multiplication...\n");
    
    uint64 start_cycles = rdcycles();
    uint64 start_time = rdtime();
    uint64 start_instret = rdinstret();
    
    matrix_multiply(A, B, C, size);
    
    uint64 end_cycles = rdcycles();
    uint64 end_time = rdtime();
    uint64 end_instret = rdinstret();
    
    // Calculate differences
    uint64 cycles = end_cycles - start_cycles;
    uint64 time = end_time - start_time;
    uint64 instructions = end_instret - start_instret;
    
    // Verify result
    verify_result(C, size);
    
    // Print results to console
    printf("\n--- Performance Metrics ---\n");
    printf("Cycles:       %ld\n", cycles);
    printf("Time:         %ld\n", time);
    printf("Instructions: %ld\n", instructions);
    
    // Calculate derived metrics
    if (cycles > 0) {
        uint64 ipc = (instructions * 100) / cycles;
        printf("IPC (x100):   %ld\n", ipc);
    }
    
    // Calculate operations
    uint64 operations = (uint64)size * size * (2 * size - 1);
    printf("Total operations: %ld\n", operations);
    
    if (cycles > 0) {
        uint64 ops_per_cycle = operations / cycles;
        printf("Ops per cycle: %ld\n", ops_per_cycle);
    }
    
    // Save to file
    save_results(fd, size, cycles, time, instructions);
    
    // Also print CSV line to console for easy copying
    printf("\nCSV: %d,%ld,%ld,%ld,%ld\n", size, cycles, time, instructions, operations);
    
    printf("\n");
}

int main(int argc, char *argv[]) {
    printf("===========================================\n");
    printf("   Matrix Multiplication Benchmark\n");
    printf("   Using Expanded 512MB RAM\n");
    printf("===========================================\n");
    
    // Open file for writing results
    int fd = open("benchmark_results.txt", O_CREATE | O_WRONLY);
    if (fd < 0) {
        printf("Failed to open output file\n");
        exit(1);
    }
    
    // Write header
    write_str(fd, "size,cycles,time,instructions,operations\n");
    
    // Test different matrix sizes
    int sizes[] = {64, 128, 256, 512};
    int num_sizes = 4;
    
    printf("\nThis benchmark will test matrix multiplication\n");
    printf("for sizes: ");
    for (int i = 0; i < num_sizes; i++) {
        printf("%d ", sizes[i]);
    }
    printf("\n");
    
    printf("\n=== CSV FORMAT (for easy copying) ===\n");
    printf("size,cycles,time,instructions,operations\n");
    
    // Run benchmarks for each size
    for (int i = 0; i < num_sizes; i++) {
        benchmark_size(sizes[i], fd);
    }
    
    close(fd);
    
    printf("\n===========================================\n");
    printf("   Benchmark Complete!\n");
    printf("===========================================\n");
    printf("\nSummary:\n");
    printf("- All matrix sizes utilized the expanded 512MB RAM\n");
    printf("- Performance metrics collected using CSR system calls\n");
    printf("- Results saved to: benchmark_results.txt\n");
    printf("\nTo view results: cat benchmark_results.txt\n");
    
    exit(0);
}
