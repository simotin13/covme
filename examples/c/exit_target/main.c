#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern void wait_sec();

int add(int a, int b) 
{
    return a+b;
}
 
int main(int argc, char **argv) {
    int total = 0;

    while(1) {
        total = add(total, 1);
        printf("total:%d\n", total);

        printf("wait 10 seconds\n");
        wait_sec(10);
    }

    exit(0);
}
