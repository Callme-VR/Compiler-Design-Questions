%{
#include <stdio.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*    { printf("Valid Identifier: %s\n", yytext); }
[0-9][a-zA-Z0-9_]*        { printf("Invalid Identifier: %s (starts with number)\n", yytext); }
[ \t\n]+                  ; // Skip whitespace
.                         { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    printf("Enter identifiers (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
