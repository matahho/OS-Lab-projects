#define QUEUE_LEN 10



struct priorityQueue
{
	struct proc* proc;
	struct proc* next;
};


struct sleeplock {
  uint locked;       // Is the lock held?
  struct spinlock lk; // spinlock protecting this sleep lock
  struct priorityQueue queue;


  // For debugging:
  char *name;        // Name of lock.
  int pid;           // Process holding lock
};


