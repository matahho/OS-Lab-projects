
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
initplock(struct prioritylock *lk, char *name)
{

  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
  lk->priority = 0;
}

void acquirep(struct prioritylock *lk)
{
	

}