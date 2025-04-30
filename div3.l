question->desing a dfa in lex code over symbol which contain set string where every string start with a's and end with b's

%{
#include <stdio.h>
%}

%s A B DEAD

%%

<INITIAL>a        { BEGIN A; }
<INITIAL>[^a\n]   { BEGIN DEAD; }
<INITIAL>\n       { printf("invalid string\n"); }

<A>a              { BEGIN A; }
<A>b              { BEGIN B; }
<A>[^ab\n]        { BEGIN DEAD; }
<A>\n             { printf("invalid string\n"); BEGIN INITIAL; }

<B>a              { BEGIN A; }
<B>b              { BEGIN B; }
<B>[^ab\n]        { BEGIN DEAD; }
<B>\n             { printf("Valid string\n"); BEGIN INITIAL; }

<DEAD>[^\n]       { /* Stay in DEAD */ }
<DEAD>\n          { printf("invalid string\n"); BEGIN INITIAL; }

%%

int main() {
    printf("Enter strings (press Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
