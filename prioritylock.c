#include "stddef.h"
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
  initlock(&lk->lk, "priority lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
}


void 
add_to_pq (struct proc* head , struct proc* proc){
	struct priorityQueue* new_node = (struct priorityQueue*)malloc (sizeof(struct priorityQueue));
	new_node->proc = proc;
  new_node->next = NULL;


  struct priorityQueue* current = head;
    struct priorityQueue* prev = NULL;

    // Find the position to insert the new node based on priority
    while (current != NULL && current->proc->pid < proc->pid) {
        prev = current;
        current = current->next;
      
    }

    if (prev == NULL) {
      new_node->next = head;
      head = new_node;
    } else {
        prev->next = new_node;
        new_node->next = current;
    }
}


struct proc* pop_from_pq(struct priorityQueue** head) {
    if (*head == NULL) {
        // Priority queue is empty
        return NULL;
    }

    struct priorityQueue* temp = *head;
    struct proc* popped_proc = temp->proc;

    *head = (*head)->next;

    free(temp);  
    return popped_proc;
}


void 
acquire_prioritylock(struct prioritylock* plk) {
    struct proc* curproc = myproc();

    acquire(&plk->lk); 

    if (plk->locked) {
        
        add_to_pq(&plk->queue, curproc);

        
        while (plk->locked) {
            sleep(plk, &plk->lk);
        }
    } else {
       
        plk->locked = 1;
        plk->pid = curproc->pid;
    }

    release(&plk->lk); 
}

