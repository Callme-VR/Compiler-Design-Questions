%{
#include <stdio.h>

FILE *out;
int in_whitespace = 0;
%}

%%

[ \t\n]+ {
    if (!in_whitespace) {
        fputc(' ', out);
        in_whitespace = 1;
    }
}

[^ \t\n]+ {
    fputs(yytext, out);
    in_whitespace = 0;
}

%%

int main() {
    FILE *in = fopen("input.txt", "r");
    out = fopen("output.txt", "w");

    if (!in || !out) {
        perror("File open error");
        return 1;
    }

    yyin = in;
    yylex();

    fclose(in);
    fclose(out);
    printf("Whitespace replaced and output saved to output.txt\n");
    return 0;
}

int yywrap() {
    return 1;
}
