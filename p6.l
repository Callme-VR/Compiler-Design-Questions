%{
#include <stdio.h>

int word_count = 0;
int space_count = 0;
int char_count = 0;
%}

%%

[ \t]+              { space_count += yyleng; char_count += yyleng; }
\n                  { char_count++; }
[a-zA-Z0-9_]+       { word_count++; char_count += yyleng; }
.                   { char_count++; }

%%

int main() {
    FILE *fp = fopen("input.txt", "r");
    if (!fp) {
        perror("Cannot open input.txt");
        return 1;
    }

    yyin = fp;
    yylex();
    fclose(fp);

    printf("Total Characters: %d\n", char_count);
    printf("Total Words: %d\n", word_count);
    printf("Total Spaces: %d\n", space_count);

    return 0;
}

int yywrap() {
    return 1;
}
