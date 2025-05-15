%{
#include <stdio.h>
%}

%%

[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}   { printf("Valid Email: %s\n", yytext); }
[ \t\n]+                                         ;  // Ignore whitespace
.                                                { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    printf("Enter email addresses (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
