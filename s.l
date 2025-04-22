%{
    #include <stdio.h>
    int count_lines = 0, count_char = 0, count_word = 0;
%}

%%
\n      { count_lines++; count_char++; }
[ \t]+  { }
\w+     { count_word++; count_char += yyleng; }
.       { count_char++; }
%%

int main() {
    FILE *fp = fopen("giventext.txt", "r");
    yyin = fp;
    yylex();

    printf("Count of lines: %d\n", count_lines);
    printf("Count of words: %d\n", count_word);
    printf("Count of characters: %d\n", count_char);

    fclose(fp);
    return 0;
}

int yywrap() {
    return 1;
}
