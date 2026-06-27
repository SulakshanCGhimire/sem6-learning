// Lab 0: Simulation  of LCG using C

#include <stdio.h>

int main() {
    int seed = 987;
    int a = 37;
    int c = 41;
    int m = 1000;

    int x = seed;

    printf("Random Numbers:\n");

    for(int i = 0; i < 10; i++) {
        printf("%d\n", x);
        x = (a * x + c) % m;
    }

    return 0;
}