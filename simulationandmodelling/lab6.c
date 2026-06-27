// Simulation of Rolling of Dice

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int n;
    int count[7] = {0};

    printf("Enter the number of dice rolls: ");
    scanf("%d", &n);

    // Seed the random number generator
    srand(time(0));

    // Simulate dice rolls
    for(int i = 0; i < n; i++)
    {
        int dice = (rand() % 6) + 1;
        count[dice]++;
    }

    // Display frequencies
    printf("\nDice Face\tFrequency\n");

    for(int i = 1; i <= 6; i++)
    {
        printf("%d\t\t%d\n", i, count[i]);
    }

    return 0;
}