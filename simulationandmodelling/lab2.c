// Lab 2: Simulation of Coin toss

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int n = 500;
    int heads = 0;
    int tails = 0;

    // Seed the random number generator
    srand(time(0));

    // Simulate coin tosses
    for(int i = 0; i < n; i++)
    {
        int toss = rand() % 2;

        if(toss == 1)
            heads++;
        else
            tails++;
    }

    // Calculate probabilities
    float pHeads = (float)heads / n;
    float pTails = (float)tails / n;

    // Display results
    printf("Total Tosses = %d\n", n);
    printf("Heads = %d\n", heads);
    printf("Tails = %d\n", tails);
    printf("Probability of Heads = %.3f\n", pHeads);
    printf("Probability of Tails = %.3f\n", pTails);

    return 0;
}