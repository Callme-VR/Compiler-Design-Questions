%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token MINUS DIVI PLUS LP RP MULT NUMB

%left PLUS MINUS
%left MULT DIVI


%%

expr:
      NUMB
    | expr PLUS expr
    | expr MULT expr
    | expr MINUS expr
    | expr DIVI expr
    | LP expr RP
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter the Expression: ");
    int x = yyparse();
    if (x == 0) {
        printf("Valid Expression!!\n");
    }
    return 0;
}
