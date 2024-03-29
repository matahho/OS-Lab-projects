#include "types.h"
#include "user.h"

#define NCHILD 10

int main()
{
    int pid;
    prioritylockInit();

    pid = fork();
    for(int i=1; i<NCHILD; i++)
        if(pid<0)
        {
            printf(1, "fork failed\n");
            exit();
        }
        else if(pid>0)
            pid = fork();
    
    if (pid<0)
    {
            printf(1, "fork failed\n");
            exit();
    }
    else if (pid == 0)
    {
        printf(1, "child adding to shared++\n");
        prioritylockTest();
    }
    else
    {
        for(int i=0; i<NCHILD; i++)
            wait();
        printf(1, "user program finished\n");
        
    }
    
    exit();
    
    return 0;
    
}