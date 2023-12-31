
#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"
#include "prioritylock.h"

void
initsleeplock(struct prioritylock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
  lk->priorityQueue = NULL;

}


void 
add_to_pq (struct proc* head , struct proc* proc){
	struct priorityQueue* new_node = (struct priorityQueue*)malloc (sizeof(struct priorityQueue));
	new_node->proc
}


