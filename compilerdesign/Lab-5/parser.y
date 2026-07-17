%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    double num;
}

%token <num> NUMBER
%token NEWLINE
%token MOD

%type <num> expression

/* Operator precedence, low to high */
%left '+' '-'
%left '*' '/' MOD
%left '%'
%right UMINUS

%%

program
        : /* empty */
        | program line
        ;

line
        : expression NEWLINE
            {
                printf("Answer = %g\n", $1);
                printf("Enter Expression : ");
            }
        | NEWLINE
            {
                printf("Enter Expression : ");
            }
        | error NEWLINE
            {
                yyerrok;
                printf("Enter Expression : ");
            }
        ;

expression
        : expression '+' expression
            {
                $$ = $1 + $3;
            }

        | expression '-' expression
            {
                $$ = $1 - $3;
            }

        | expression '*' expression
            {
                $$ = $1 * $3;
            }

        | expression '/' expression
            {
                if ($3 == 0)
                {
                    printf("Division by zero\n");
                    $$ = 0;
                }
                else
                {
                    $$ = $1 / $3;
                }
            }

        | expression MOD expression
            {
                if ($3 == 0)
                {
                    printf("Modulo by zero\n");
                    $$ = 0;
                }
                else
                {
                    $$ = fmod($1, $3);
                }
            }

        | expression '%'
            {
                $$ = $1 / 100.0;
            }

        | '(' expression ')'
            {
                $$ = $2;
            }

        | '{' expression '}'
            {
                $$ = $2;
            }

        | '-' expression %prec UMINUS
            {
                $$ = -$2;
            }

        | NUMBER
            {
                $$ = $1;
            }

        ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error : %s\n", s);
}

int main()
{
    printf("Enter Expression : ");
    yyparse();
    return 0;
}
