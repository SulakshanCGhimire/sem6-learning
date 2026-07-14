%{
#include <stdio.h>
%}

%%

[0-9]+      { printf("%s", yytext); }
            { /* ignore other characters */}

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}