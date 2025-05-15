%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS MUL DIV LP RP
%left PLUS MINUS
%left MUL DIV
%right UMINUS

%%

E: E PLUS E
 | E MINUS E
 | E MUL E
 | E DIV E
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
