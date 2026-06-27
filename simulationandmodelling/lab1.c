// Lab 1: Chi-Square Test for Fairness of a Dice

#include <stdio.h>
#include <math.h>

int main()
{
    int observed[6] = {8, 9, 10, 11, 12, 10};
    int total = 0;
    float expected;
    float chiSquare = 0;
    float criticalValue = 11.07;

    // Calculate total observations
    for(int i = 0; i < 6; i++)
    {
        total += observed[i];
    }

    // Calculate expected frequency
    expected = (float)total / 6;

    // Calculate Chi-Square value
    for(int i = 0; i < 6; i++)
    {
        chiSquare += pow(observed[i] - expected, 2) / expected;
    }

    printf("Total Observations = %d\n", total);
    printf("Expected Frequency = %.2f\n", expected);
    printf("Chi-Square Value = %.2f\n", chiSquare);
    printf("Critical Value = %.2f\n", criticalValue);

    if(chiSquare < criticalValue)
        printf("\nAccept H0: The dice is fair.\n");
    else
        printf("\nReject H0: The dice is not fair.\n");

    return 0;
}