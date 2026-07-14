/*
Q. Write a Lex program to identify Integer and Floating Point (Decimal)
numbers from an input file. Ignore all other tokens.
*/

%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

extern FILE *yyin;

/* Counters */
int totalTokens = 0;
int integerCount = 0;
int floatCount = 0;
int decimalCount = 0;

char seenTokens[500][100];
int seenCount = 0;

int isNewToken(char *token)
{
    for(int i=0;i<seenCount;i++)
    {
        if(strcmp(seenTokens[i],token)==0)
            return 0;
    }

    strcpy(seenTokens[seenCount],token);
    seenCount++;
    return 1;
}

%}

/* ---------- Definitions ---------- */

DIGIT        [0-9]

INTCONST     {DIGIT}+

FLOATCONST   {DIGIT}+"."{DIGIT}+

%%


{FLOATCONST} {

    printf("FLOAT        : %s\n",yytext);

    floatCount++;
    decimalCount++;

    if(isNewToken(yytext))
        totalTokens++;
}


{INTCONST} {

    printf("INTEGER      : %s\n",yytext);

    integerCount++;

    if(isNewToken(yytext))
        totalTokens++;
}


.|\n    ;

%%

int main()
{
    yyin = fopen("input.c","r");

    if(yyin==NULL)
    {
        printf("Cannot open input.c\n");
        return 1;
    }

    yylex();

    fclose(yyin);

    printf("\n====================================\n");
    printf("SUMMARY\n");
    printf("====================================\n");

    printf("Integers      : %d\n",integerCount);
    printf("Floats        : %d\n",floatCount);
    printf("Decimals      : %d\n",decimalCount);
    printf("Total Tokens  : %d\n",totalTokens);

    return 0;
}

int yywrap()
{
    return 1;
}

