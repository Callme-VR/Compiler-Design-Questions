%{
#include <stdio.h>
#include <stdlib.h> // for atoi()
%}

%%

[0-9]+ {
    int num = atoi(yytext);
    if (num % 2 == 0)
        printf("%d is Even\n", num);
    else
        printf("%d is Odd\n", num);
}

[ \t\n]+ ; // ignore spaces, tabs, and newlines

. { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter a number:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
