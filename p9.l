%{
#include <stdio.h>

FILE *out;
%}

%%

"//".*                { /* skip single-line comment */ }
"/*"([^*]|\*+[^*/])*\*+"/"    { /* skip multi-line comment */ }

.|\n                  { fputc(yytext[0], out); }

%%

int main() {
    FILE *in = fopen("input.c", "r");
    out = fopen("output.c", "w");

    if (!in || !out) {
        perror("File open error");
        return 1;
    }

    yyin = in;
    yylex();

    fclose(in);
    fclose(out);
    printf("Comments removed and code written to output.c\n");
    return 0;
}

int yywrap() {
    return 1;
}
