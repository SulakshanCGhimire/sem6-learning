%{
#include <stdio.h>
%}

%%

[0-9]+(\.[0-9]+)?\n     { printf("Valid Number\n"); }

.*\n                    { printf("Invalid Number\n"); }

%%

int main()
{
    printf("Enter input: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}