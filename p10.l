%{
#include <stdio.h>

FILE *out;
%}

%%

\<[^>]+\>     { fprintf(out, "%s\n", yytext); }  // Matches and stores HTML tags

[^\n<>]+      ;   // Ignore text outside tags

.|\n          ;   // Ignore other characters

%%

int main() {
    FILE *in = fopen("input.html", "r");
    out = fopen("tags.txt", "w");

    if (!in || !out) {
        perror("File open error");
        return 1;
    }

    yyin = in;
    yylex();

    fclose(in);
    fclose(out);
    printf("HTML tags extracted to tags.txt\n");
    return 0;
}

int yywrap() {
    return 1;
}
