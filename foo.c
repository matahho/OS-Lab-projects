#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
    
    for(int i=0 ; i < 10 ; i++){

        int pid = fork();
        if(pid == 0){
            char inp[10] = "outfile";
            inp[7] = '0' + i;
            inp[8] = '\0';
            int fd = open(inp , O_WRONLY );

            write(fd , "hellow" , 7);
            close(fd);
            exit();
        }
    }

    for(int i=0 ;i < 10 ; i++){
        wait();
    }

    exit();
}