#define QUEUE_LEN 10



struct priorityQueue
{
	struct proc* proc;
	struct priorityQueue* next;
};


struct prioritylock {
  uint locked;       // Is the lock held?
  struct spinlock lk; // spinlock protecting this priority lock
  struct priorityQueue queue;


  // For debugging:
  char *name;        // Name of lock.
  int pid;           // Process holding lock
};


