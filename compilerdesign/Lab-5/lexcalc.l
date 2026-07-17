%{
#include "parser.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+(\.[0-9]+)?   {
                        yylval.num = atof(yytext);
                        return NUMBER;
                    }

"mod"       return MOD;

"+"         return '+';
"-"         return '-';
"*"         return '*';
"/"         return '/';
"%"         return '%';
"("         return '(';
")"         return ')';
"{"         return '{';
"}"         return '}';

\n          return NEWLINE;

[ \t]       ;   /* skip spaces/tabs only */

.           {
                printf("Unknown character : %s\n", yytext);
            }

%%

int yywrap()
{
    return 1;
}
