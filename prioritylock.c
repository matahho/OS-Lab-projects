#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "prioritylock.h"


void watch_pq(struct prioritylock *lk){
  
  struct priorityQueue* head = lk->queue;
  cprintf("pid that uses lock : %d \n", lk->pid);
  cprintf("priority lock :\n");
  if (head == 0){
    return;
  }
  int i = 1;
  while(1){
    if (head == 0){
      break;
    }
    cprintf("%d- pid : %d\n", i, head->proc->pid);
    head = head->next;
  }
}

void
initplock(struct prioritylock *lk, char *name)
{
  initlock(&lk->lk, "priority lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
  lk->queue = 0;
}

void add_to_pq(struct priorityQueue *queue, struct proc* proc){
    struct priorityQueue* current = (struct priorityQueue*)kalloc();
    if (current == 0){
        panic("Alloc failded");
    }
    current->proc = proc;
    struct priorityQueue* head = queue;
    if (head == 0){
        current->next = 0;
        queue = current;
        return;
    }
    while(1){
        if (head->next == 0){
            current->next = 0;
            head->next = current;
            break;
        }
        if (head->next->proc->pid < current->proc->pid){
            head = head->next;
        }
        else{
            struct priorityQueue* temp = head->next;
            head->next = current;
            current->next = temp;
            break;
        }
    }
}

struct proc* pop_from_pq(struct priorityQueue *queue){
    if (queue == 0){
        return 0;
    }
    struct proc* ans = queue->proc;
    struct priorityQueue* temp = queue->next;
    kfree((char *)queue);
    queue = temp;

    return ans;
}

void
acquire_prioritylock(struct prioritylock *lk)
{
  acquire(&lk->lk);
  if (lk->locked) {
    add_to_pq(lk->queue, myproc());
    sleep(lk, &lk->lk);
  }

  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
}

void
release_prioritylock(struct prioritylock *lk)
{
  acquire(&lk->lk);
  struct proc* proc = pop_from_pq(lk->queue);
  lk->locked = 0;
  lk->pid = 0;
  if (proc != 0){
    wakeup(proc);
  }
  release(&lk->lk);
}

