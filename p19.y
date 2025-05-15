%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMB

%left '+' '-'
%left '*' '/'


%%
expr:
     expr '+' expr {printf("+ ");}
    | expr '*' expr {printf("* ");}
    | expr '-' expr {printf("- ");}
    | expr '/' expr   {printf("/ ");}
    | NUMB {printf("%d ",$1);}
    ;
%%

void yyerror(const char *s) {
    printf("\n");
}

int main() {
    printf("Enter the Expression: ");
    yyparse();
    return 0;
}
