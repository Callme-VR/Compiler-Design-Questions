%{
#include <stdio.h>
%}

%x A B C DEAD

%%

<INITIAL>[ab]    { BEGIN(A); }
<INITIAL>\n      { printf("Accepted (length %% 3 == 0)\n"); }

<A>[ab]          { BEGIN(B); }
<A>\n            { printf("Rejected (length %% 3 != 0)\n"); }

<B>[ab]          { BEGIN(C); }
<B>\n            { printf("Rejected (length %% 3 != 0)\n"); }

<C>[ab]          { BEGIN(A); }
<C>\n            { printf("Accepted (length %% 3 == 0)\n"); }

.|\n             { BEGIN(DEAD); }
<DEAD>.          { /* Stay in DEAD */ }
<DEAD>\n         { printf("Rejected (Invalid input)\n"); BEGIN(INITIAL); }

%%
int main() {
    printf("Enter strings over {a,b} (press Enter after each):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
