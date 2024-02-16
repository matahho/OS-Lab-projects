#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

const int string_max_length = 16;
            
int main(int argc, char *argv[]) {
    if(argc != 3){
        printf(2, "Error: number of args...\n");
        exit();
    }

    char result[string_max_length];

    int maxLen = 0;

    for (int i = 0; i < string_max_length; i++) {
        char letter1 = argv[1][i];
        char letter2 = argv[2][i];

        if (letter1 == '\0' && letter2 == '\0') {
            break; // End of both strings
        }

        maxLen++;
    }

    for (int i = 0; i < maxLen; i++) {
        char letter1 = argv[1][i];
        char letter2 = argv[2][i];

        if (letter1 >= letter2) {
            result[i] = '0';
        } else {
            result[i] = '1';
        }
    }
    result[maxLen] = '\0';

    unlink("strdiff_result.txt");
    int fd = open("strdiff_result.txt", O_CREATE | O_RDWR);

    write(fd, result, maxLen);

    close(fd);
    exit();
}
