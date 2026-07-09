/*
Q. Write a Lex program to recognize C Keywords, Identifiers, 
Integer constants, and Floating Point (Decimal) constants from an input file. 
Ignore all other tokens and display the total count of each category.
*/


%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

extern FILE *yyin;

/* Counters */
int totalTokens = 0;

int keywordCount = 0;
int identifierCount = 0;
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

DIGIT      [0-9]
LETTER     [a-zA-Z_]

ID         {LETTER}({LETTER}|{DIGIT})*

INTCONST   {DIGIT}+

FLOATCONST {DIGIT}+"."{DIGIT}+

KEYWORD    auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while

%%


{KEYWORD} {

    printf("KEYWORD      : %s\n",yytext);

    keywordCount++;

    if(isNewToken(yytext))
        totalTokens++;
}


{ID} {

    printf("IDENTIFIER   : %s\n",yytext);

    identifierCount++;

    if(isNewToken(yytext))
        totalTokens++;
}


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




[ \t\r\n]+ ;

. ;

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

    printf("Keywords      : %d\n",keywordCount);
    printf("Identifiers   : %d\n",identifierCount);
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

