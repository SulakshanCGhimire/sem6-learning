// Random number generation using Middle square method

#include <stdio.h>

int main()
{
    int seed, n = 5;
    long square;

    printf("Enter a 4-digit seed: ");
    scanf("%d", &seed);

    printf("Random Numbers:\n");

    for(int i = 0; i < n; i++)
    {
        square = (long)seed * seed;

        // Extract middle 4 digits
        seed = (square / 100) % 10000;

        printf("%04d\n", seed);
    }

    return 0;
}