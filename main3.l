%{
#include <stdio.h>
%}
%S A B C DEAD
%%
<INITIAL>a    BEGIN A;
<INITIAL>b    BEGIN A;
<INITIAL>\n   { printf("Accepted in\n"); BEGIN INITIAL; }

<A>a          BEGIN B;
<A>b          BEGIN B;

<B>a          BEGIN C;
<B>b          BEGIN C;

<C>a          BEGIN INITIAL;
<C>b          BEGIN INITIAL;

<A>[^\nab]    { printf("Not accepted in\n"); BEGIN DEAD; }
<B>[^\nab]    { printf("Not accepted in\n"); BEGIN DEAD; }
<C>[^\nab]    { printf("Not accepted in\n"); BEGIN DEAD; }
<A>\n         { printf("Not accepted in\n"); BEGIN INITIAL; }
<B>\n         { printf("Not accepted in\n"); BEGIN INITIAL; }
<C>\n         { printf("Accepted in\n"); BEGIN INITIAL; }
<DEAD>\n      { printf("Not accepted in\n"); BEGIN INITIAL; }
<DEAD>.       BEGIN DEAD;

%%

int main() {
    printf("Enter string:\n");
    yylex();
    printf("In main\n");
    return 0;
}

int yywrap() {
    return 1;
}