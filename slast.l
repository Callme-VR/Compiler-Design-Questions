
%{
#include <stdio.h>
%}
 
%%
"//"[^\n]*                     { /* Ignore single-line comments */ }
"/"([^][*]+[^/])*[*]+"/" { /* Ignore multi-line comments */ }
.|\n                        { fputc(yytext[0], yyout); } 
%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.c", "r");
    yyout = fopen("output.c", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}
