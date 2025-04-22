%{
#include <stdio.h>
int float_count = 0, int_count = 0;
%}

%%
[0-9]+\.[0-9]+ { float_count++; printf("Float: %s\n", yytext); }
[0-9]+ { int_count++; printf("Integer: %s\n", yytext); }
.|\n { printf("Invalid: %s\n", yytext); } 

%%
int main() {
    printf("Enter input:\n");
    yylex();
    printf("Integer count: %d\n", int_count);
    printf("Float count: %d\n", float_count);
    return 0;
}

int yywrap() {
    return 1;
}
