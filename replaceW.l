%{
    #include <stdio.h>
%}

%%
[\t""]+ { fprintf(yyout, "%s\n", yytext); }
.|\n   { fprintf(yyout, "%s\n", yytext); }
%%

int main() {
    extern FILE *yyin,*yyout;

    yyin = fopen("inputr.txt", "r");
    yyout = fopen("outputr.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}
