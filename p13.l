%{
#include <stdio.h>
%}

%%

([0-9]+)"."[0-9]+      { printf("Float constant: %s\n", yytext); }
[0-9]+                { printf("Integer constant: %s\n", yytext); }

[ \t\n]+              ;  // Ignore whitespace

.                     { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter numbers (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
