#include <stdio.h>
#include <unistd.h>

void wait_sec(int sec) {
	printf("waiting...\n");
	sleep(sec);
}
