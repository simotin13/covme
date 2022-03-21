#include <stdio.h>

int main(int argc, char **argv)
{
    int num;
    printf("input number> ");
    scanf("%d", &num);
    if (num == 3) {
        fprintf(stdout, "your input number is 3\n");
    } else {
        fprintf(stdout, "your input number %d is not 3\n", num);
    }
    return 0;
}
