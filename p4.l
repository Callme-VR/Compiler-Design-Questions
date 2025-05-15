%{
#include <stdio.h>
#include <string.h>

char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if",
    "int", "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
};
int is_keyword(char *word) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext))
        printf("Keyword: %s\n", yytext);
    else
        printf("Identifier: %s\n", yytext);
}

[ \t\n]+ ;  // Ignore whitespace

. printf("Symbol or Invalid: %s\n", yytext);

%%

int main() {
    printf("Enter words (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
