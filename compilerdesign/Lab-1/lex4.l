%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define MAX_SYMBOLS 500
#define MAX_ERRORS 500
#define MAX_TOKENS 1000

extern FILE *yyin;

/* Counters */
int lineNo = 1;
int totalTokens = 0;
int totalChars = 0;

int keywordCount = 0;
int identifierCount = 0;
int integerCount = 0;
int floatCount = 0;
int octalCount = 0;
int hexCount = 0;
int stringCount = 0;
int charCount = 0;
int operatorCount = 0;
int symbolCount = 0;
int commentCount = 0;
int preprocessorCount = 0;
int errorCount = 0;

/* Per-operator counts */
int arithCount = 0;
int assignCount = 0;
int relCount = 0;
int logCount = 0;
int incrCount = 0;
int bitwiseCount = 0;

/* Bracket counters */
int roundBracket = 0;
int curlyBracket = 0;
int squareBracket = 0;

typedef struct
{
    char name[100];
    int line;
} Symbol;

typedef struct
{
    int line;
    char msg[200];
} ErrorRec;

typedef struct {
    char lexeme[100];
} Token;

Token tokenTable[MAX_TOKENS];
int tokenIndex = 0;

Symbol symTable[MAX_SYMBOLS];
ErrorRec errTable[MAX_ERRORS];

int symIndex = 0;
int errIndex = 0;

int isNewToken(char *s)
{
    for(int i=0;i<tokenIndex;i++)
    {
        if(strcmp(tokenTable[i].lexeme, s) == 0)
            return 0;
    }
    strcpy(tokenTable[tokenIndex++].lexeme, s);
    return 1;
}

void addSymbol(char *name)
{
    for(int i=0;i<symIndex;i++)
    {
        if(strcmp(symTable[i].name,name)==0)
            return;
    }
    if(symIndex < MAX_SYMBOLS)
    {
        strcpy(symTable[symIndex].name,name);
        symTable[symIndex].line=lineNo;
        symIndex++;
    }
}

void addError(char *msg)
{
    if(errIndex < MAX_ERRORS)
    {
        errTable[errIndex].line=lineNo;
        strcpy(errTable[errIndex].msg,msg);
        errIndex++;
        errorCount++;
    }
}
%}

/* ---------- Definitions ---------- */

DIGIT      [0-9]
LETTER     [a-zA-Z_]

ID         {LETTER}({LETTER}|{DIGIT})*

INTCONST   [0-9]+
FLOATCONST [0-9]+\.[0-9]+
HEXCONST   0[xX][0-9a-fA-F]+
OCTCONST   0[0-7]+

KEYWORD    auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|main|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while

%%

^#.* {
    printf("PREPROCESSOR : %s\n",yytext);
    preprocessorCount++;
    totalTokens++;
}

"//".* {
    printf("COMMENT      : %s\n",yytext);
    commentCount++;
    totalTokens++;
}

\/\*([^*]|\*+[^*/])*\*+\/ {
    printf("COMMENT      : %s\n",yytext);
    commentCount++;
    totalTokens++;
}

[0-9]+[a-zA-Z_][a-zA-Z0-9_]* {
    printf("ERROR        : Invalid Identifier %s (Line %d)\n", yytext,lineNo);
    addError("Invalid Identifier");
}

[0-9]+\.[0-9]+\.[0-9]+ {
    printf("ERROR        : Invalid Float %s (Line %d)\n", yytext,lineNo);
    addError("Invalid Float");
}

0[0-7]*[89][0-9]* {
    printf("ERROR        : Invalid Octal %s (Line %d)\n", yytext,lineNo);
    addError("Invalid Octal");
}

{KEYWORD} {
    printf("KEYWORD      : %s (Line %d)\n", yytext,lineNo);
    keywordCount++;
    totalTokens++;
}

{ID} {
    printf("IDENTIFIER   : %s (Line %d)\n", yytext,lineNo);
    addSymbol(yytext);
    identifierCount++;
    totalTokens++;
}

{FLOATCONST} {
    printf("FLOAT        : %s\n",yytext);
    floatCount++;
    totalTokens++;
}

{HEXCONST} {
    printf("HEXADECIMAL  : %s\n",yytext);
    hexCount++;
    totalTokens++;
}

{OCTCONST} {
    printf("OCTAL        : %s\n",yytext);
    octalCount++;
    totalTokens++;
}

{INTCONST} {
    printf("INTEGER      : %s\n",yytext);
    integerCount++;
    totalTokens++;
}

\"([^\"\\]|\\.)*\" {
    printf("STRING       : %s\n",yytext);
    stringCount++;
    totalTokens++;
}

\'([^\'\\]|\\.)\' {
    printf("CHARACTER    : %s\n",yytext);
    charCount++;
    totalTokens++;
}

"++"|"--" {
    printf("OPERATOR     : %s (Increment/Decrement)\n",yytext);
    incrCount++;
    operatorCount++;
    totalTokens++;
}

"+="|"-="|"*="|"/="|"%=" {
    printf("OPERATOR     : %s (Compound Assignment)\n",yytext);
    assignCount++;
    operatorCount++;
    totalTokens++;
}

"=="|"!="|">="|"<=" {
    printf("OPERATOR     : %s (Relational)\n",yytext);
    relCount++;
    operatorCount++;
    totalTokens++;
}

"&&"|"||" {
    printf("OPERATOR     : %s (Logical)\n",yytext);
    logCount++;
    operatorCount++;
    totalTokens++;
}

">>"|"<<" {
    printf("OPERATOR     : %s (Bitwise Shift)\n",yytext);
    bitwiseCount++;
    operatorCount++;
    totalTokens++;
}

"+"|"-"|"*"|"/"|"%" {
    printf("OPERATOR     : %s (Arithmetic)\n",yytext);
    arithCount++;
    operatorCount++;
    totalTokens++;
}

"=" {
    printf("OPERATOR     : %s (Assignment)\n",yytext);
    assignCount++;
    operatorCount++;
    totalTokens++;
}

"<"|">"|"!" {
    printf("OPERATOR     : %s (Relational/Logical)\n",yytext);
    relCount++;
    operatorCount++;
    totalTokens++;
}

"(" {
    printf("SYMBOL       : (\n");
    roundBracket++;
    symbolCount++;
    totalTokens++;
}

")" {
    printf("SYMBOL       : )\n");
    roundBracket--;
    symbolCount++;
    totalTokens++;
}

"{" {
    printf("SYMBOL       : {\n");
    curlyBracket++;
    symbolCount++;
    totalTokens++;
}

"}" {
    printf("SYMBOL       : }\n");
    curlyBracket--;
    symbolCount++;
    totalTokens++;
}

"[" {
    printf("SYMBOL       : [\n");
    squareBracket++;
    symbolCount++;
    totalTokens++;
}

"]" {
    printf("SYMBOL       : ]\n");
    squareBracket--;
    symbolCount++;
    totalTokens++;
}

";"|","|":" {
    printf("SYMBOL       : %s\n",yytext);
    symbolCount++;
    totalTokens++;
}

[ \t\r]+ {
    totalChars += yyleng;
}

\n {
    lineNo++;
    totalChars++;
}

. {
    char msg[200];
    sprintf(msg,"Illegal Character %s",yytext);
    printf("ERROR        : Illegal Character %s (Line %d)\n", yytext,lineNo);
    addError(msg);
}

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
    printf("SYMBOL TABLE\n");
    printf("====================================\n");
    printf("%-20s %-10s\n","IDENTIFIER","LINE");
    for(int i=0;i<symIndex;i++)
        printf("%-20s %-10d\n", symTable[i].name, symTable[i].line);

    printf("\n====================================\n");
    printf("ERROR TABLE\n");
    printf("====================================\n");
    for(int i=0;i<errIndex;i++)
        printf("Line %-5d %s\n", errTable[i].line, errTable[i].msg);

    printf("\n====================================\n");
    printf("SUMMARY\n");
    printf("====================================\n");
    printf("Keywords      : %d\n",keywordCount);
    printf("Identifiers   : %d\n",identifierCount);
    printf("Integers      : %d\n",integerCount);
    printf("Floats        : %d\n",floatCount);
    printf("Hexadecimals  : %d\n",hexCount);
    printf("Octals        : %d\n",octalCount);
    printf("Strings       : %d\n",stringCount);
    printf("Characters    : %d\n",charCount);
    printf("Operators     : %d\n",operatorCount);
    printf("  Arithmetic  : %d\n",arithCount);
    printf("  Assignment  : %d\n",assignCount);
    printf("  Relational  : %d\n",relCount);
    printf("  Logical     : %d\n",logCount);
    printf("  Incr/Decr   : %d\n",incrCount);
    printf("  Bitwise     : %d\n",bitwiseCount);
    printf("Symbols       : %d\n",symbolCount);
    printf("Comments      : %d\n",commentCount);
    printf("Preprocessor  : %d\n",preprocessorCount);
    printf("Errors        : %d\n",errorCount);
    printf("Total Tokens  : %d\n",totalTokens);

    printf("\nBracket Status\n");
    printf("() : %s\n", roundBracket==0 ? "Balanced" : "Not Balanced");
    printf("{} : %s\n", curlyBracket==0 ? "Balanced" : "Not Balanced");
    printf("[] : %s\n", squareBracket==0 ? "Balanced" : "Not Balanced");

    return 0;
}

int yywrap()
{
    return 1;
}