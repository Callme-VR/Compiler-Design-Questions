%{
#include <stdio.h>
%}

%s A B C DEAD

%%

<INITIAL>a          { BEGIN(A); }
<INITIAL>b          { BEGIN(B); }
<INITIAL>\n         { printf("Accepted\n"); BEGIN(INITIAL); }
<INITIAL>[^ab\n]    { BEGIN(DEAD); }

<A>a               { BEGIN(INITIAL); }
<A>b               { BEGIN(C); }
<A>\n              { printf("Not Accepted\n"); BEGIN(INITIAL); }
<A>[^ab\n]         { BEGIN(DEAD); }

<B>b               { BEGIN(INITIAL); }
<B>a               { BEGIN(C); }
<B>\n              { printf("Not Accepted\n"); BEGIN(INITIAL); }
<B>[^ab\n]         { BEGIN(DEAD); }

<C>a               { BEGIN(B); }
<C>b               { BEGIN(A); }
<C>\n              { printf("Not Accepted\n"); BEGIN(INITIAL); }
<C>[^ab\n]         { BEGIN(DEAD); }

<DEAD>[^\n]        { BEGIN(DEAD); }
<DEAD>\n           { printf("Not Accepted\n"); BEGIN(INITIAL); }

%%

int main() {
    printf("Enter the string:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
