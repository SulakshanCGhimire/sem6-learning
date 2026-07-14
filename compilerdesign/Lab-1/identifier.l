%{
#include<stdio.h>
%}

%%

[0-9]+(\.[0-9]+)?       { printf("%s is a Number\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("%s is an Identifier\n", yytext); }

[+\-*/=%<>!&|]+         { printf("%s is an Operator\n", yytext); }

[ \t\n]                 { /* ignore whitespace */ }

.                       { printf("%s is Unknown\n", yytext); }

%%

int main()
{
    printf("Enter input (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}