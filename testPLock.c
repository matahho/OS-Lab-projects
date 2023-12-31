// test_priority_lock.c

#include "types.h"
#include "stddef.h" // Include the header file for NULL
#include "user.h"

void worker(void *arg) {
    int pid = getpid();

    // Print a message indicating that the process is starting
    printf(1, "Process %d is starting\n", pid);

    // Acquire the priority lock
    acquire_prioritylock("my_priority_lock");

    // Critical section: Access the shared resource
    printf(1, "Process %d is in the critical section\n", pid);

    // Release the priority lock
    release_prioritylock("my_priority_lock");

    // Print a message indicating that the process is done
    printf(1, "Process %d is done\n", pid);

    exit();
}

int main() {
    int i, pid;

    // Initialize the priority lock
    init_prioritylock("my_priority_lock");

    // Create multiple processes to test the priority lock
    for (i = 0; i < 5; i++) {
        pid = fork();
        if (pid == 0) {
            // Child process
            worker(NULL);
        } else if (pid > 0) {
            // Parent process
            // Do nothing for now
        } else {
            // Fork failed
            printf(1, "Fork failed\n");
            exit();
        }
    }

    // Wait for all child processes to finish
    for (i = 0; i < 5; i++) {
        wait();
    }

    exit();
}
