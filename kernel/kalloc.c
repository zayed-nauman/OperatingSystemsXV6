// Physical memory allocator, for user processes,
// kernel stacks, page-table pages,
// and pipe buffers. Allocates whole 4096-byte pages.

#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "riscv.h"
#include "defs.h"

void freerange(void *pa_start, void *pa_end);

extern char end[]; // first address after kernel.
                   // defined by kernel.ld.

struct run {
  struct run *next;
};

struct {
  struct spinlock lock;
  struct run *freelist;
} kmem;

void
kinit()
{
  initlock(&kmem.lock, "kmem");
  freerange(end, (void*)PHYSTOP);
  superinit(); 
}

#define NSUPERPAGES 10  // Number of 2MB superpages to manage

struct {
  struct spinlock lock;
  void *pages[NSUPERPAGES];
  int free[NSUPERPAGES];
} superpage_allocator;

void
freerange(void *pa_start, void *pa_end)
{
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);

  uint64 super_start = SUPERPAGE_ROUNDUP((uint64)end);
  uint64 super_end = super_start + (NSUPERPAGES * SUPERPAGE_SIZE);
  
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE) {
    // Don't free pages in superpage region
    if((uint64)p >= super_start && (uint64)p < super_end)
      continue; 
    kfree(p);
}

}

// Free the page of physical memory pointed at by pa,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);

  r = (struct run*)pa;

  acquire(&kmem.lock);
  r->next = kmem.freelist;
  kmem.freelist = r;
  release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
  struct run *r;

  acquire(&kmem.lock);
  r = kmem.freelist;
  if(r)
    kmem.freelist = r->next;
  release(&kmem.lock);

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
  return (void*)r;
}

void
superinit(void)
{
  initlock(&superpage_allocator.lock, "superpage");
  
  acquire(&superpage_allocator.lock);
  
  // Reserve 2MB-aligned regions from physical memory
  // Starting after kernel end, reserve NSUPERPAGES * 2MB
  uint64 start = PGROUNDUP((uint64)end);
  start = SUPERPAGE_ROUNDUP(start);
  
  for(int i = 0; i < NSUPERPAGES; i++) {
    if(start + SUPERPAGE_SIZE <= PHYSTOP) {
      superpage_allocator.pages[i] = (void*)start;
      superpage_allocator.free[i] = 1;
      start += SUPERPAGE_SIZE;
    } else {
      superpage_allocator.pages[i] = 0;
      superpage_allocator.free[i] = 0;
    }
  }
  
  release(&superpage_allocator.lock);
}

void*
superalloc(void)
 {
  void *addr = 0;
  
  acquire(&superpage_allocator.lock);
  
  for(int i = 0; i < NSUPERPAGES; i++) {
    if(superpage_allocator.free[i]) {
      addr = superpage_allocator.pages[i];
      superpage_allocator.free[i] = 0;
      memset(addr, 0, SUPERPAGE_SIZE);
      break;
    }
  }
  
  release(&superpage_allocator.lock);
  
  return addr;
}

void 
superfree(void *pa)
{
  if(((uint64)pa % SUPERPAGE_SIZE) != 0)
    panic("superfree: not aligned");
  
  acquire(&superpage_allocator.lock);
  
  for(int i = 0; i < NSUPERPAGES; i++) {
    if(superpage_allocator.pages[i] == pa) {
      superpage_allocator.free[i] = 1;
      release(&superpage_allocator.lock);
      return;
    }
  }
  
  release(&superpage_allocator.lock);
  panic("superfree: invalid address");
}
