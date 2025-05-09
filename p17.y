%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS MUL LP RP
%left PLUS MINUS
%left MUL
%right UMINUS

%%

E: E PLUS E
 | E MINUS E
 | E MUL E
 | MINUS E %prec UMINUS
 | LP E RP
 | NUMBER
 ;

%%

void yyerror(const char *s) {
    printf(" Invalid Expression\n");
}

int main() {
    printf("Enter an expression:\n");
    if (yyparse() == 0)
        printf(" Valid Expression\n"); 
    return 0;
}

int yywrap() {
    return 1;
}
