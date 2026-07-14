%{
#include <stdio.h>
int chars=0, words=0, lines=0;
%}

%%
[^\s\n]+  { words++; chars += yyleng; }
[\n]      { lines++; chars++; }
[ \t]     { chars++; }
.         { printf("Unrecognized: %s\n", yytext); chars++; }
%%

int main() {
    yylex();
    printf("Lines: %d\nWords: %d\nCharacters: %d\n", lines, words, chars);
    return 0;
}
int yywrap() {
    return 1;
}