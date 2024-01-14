#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

int isSharedMemInitilized = 0;


struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
  // TODO : find a better way 
  //check if the sharedMem is init using a glocal variable :((
  if (isSharedMemInitilized == 0 ){
    shminit();
    isSharedMemInitilized = 1 ;
  }



  acquire(&(shm_table.lock));

  // Check if the shared memory id is valid
  if (id < 0 || id >= 64) {
    release(&(shm_table.lock));
    return -1; // error.
  }
  /*Case 1: Shared memory segment already exists
   Map the existing physical page to a virtual address*/


  if (shm_table.shm_pages[id].id != 0) {
    char *va = kalloc(); // Allocate a new virtual page
    if (va == 0) {
      release(&(shm_table.lock));
      return -1; // Unable to allocate virtual page
    }

    mappages(myproc()->pgdir, va, PGSIZE, V2P(shm_table.shm_pages[id].frame), PTE_W | PTE_U);

    shm_table.shm_pages[id].refcnt++;
    *pointer = va;
    myproc()->sz += PGSIZE;
     // Update process size

  }

  // Case 2: Shared memory segment does not exist

  else {
    int i= 0 ;
    for (i = 0; i < 64; i++) {
      if (shm_table.shm_pages[i].id == 0) {
        // Found an empty entry in the shm_table
        shm_table.shm_pages[i].id = id;
        shm_table.shm_pages[i].frame = kalloc(); // Allocate a new physical page
        if (shm_table.shm_pages[i].frame == 0) {
          release(&(shm_table.lock));
          return -1; // Unable to allocate physical page
        }

        mappages(myproc()->pgdir,(char *) myproc()->sz, PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W | PTE_U);

        shm_table.shm_pages[i].refcnt = 1;
        *pointer = (char *)myproc()->sz;
        myproc()->sz += PGSIZE; // Update process size
        break;
      }
    }


    //Case 3: If no empty entry found in the shm_table
    if (i == 64) {
      release(&(shm_table.lock));
      return -1; 
    }
  }

  release(&(shm_table.lock));
  return 0; // Success
}







int shm_close(int id) {
  acquire(&(shm_table.lock));

  // Check if the shared memory id is valid
  if (id < 0 || id >= 64 || shm_table.shm_pages[id].id == 0) {
    release(&(shm_table.lock));
    return -1; 
  }

  // Decrease the reference count
  shm_table.shm_pages[id].refcnt--;

  // If the reference count drops to zero, deallocate the shared memory
  if (shm_table.shm_pages[id].refcnt == 0) {
    kfree(shm_table.shm_pages[id].frame); // Deallocate the page
    shm_table.shm_pages[id].id = 0;
    shm_table.shm_pages[id].frame = 0;
  }

  release(&(shm_table.lock));
  return 0; // Success
}