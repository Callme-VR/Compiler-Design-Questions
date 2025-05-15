%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
int yylval;
%}

%token NUMB

%left '+' '-'
%left '*' '/'

%%

stmt:
    expr '\n'   { printf("Result = %d\n", $1); }
    ;

expr:
    NUMB              { $$ = $1; }
    | expr '+' expr    { $$ = $1 + $3; }
    | expr '-' expr    { $$ = $1 - $3; }
    | expr '*' expr    { $$ = $1 * $3; }
    | expr '/' expr    {
                          if ($3 == 0) {
                              yyerror("Division by zero");
                              exit(1);
                          }
                          $$ = $1 / $3;
                       }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Simple Desk Calculator\n");
    printf("Enter expression:\n");
    yyparse();
    return 0;
}
