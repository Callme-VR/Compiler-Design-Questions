%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    double val;
}

%token <val> NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN

%type <val> expr term factor

%%

input:
    /* empty */
    | input expr '\n' { printf("Valid expression\n"); }
    ;

expr:
      expr PLUS term   { $$ = $1 + $3; }
    | expr MINUS term  { $$ = $1 - $3; }
    | term             { $$ = $1; }
    ;

term:
      term MUL factor { $$ = $1 * $3; }
    | term DIV factor { 
        if ($3 == 0) {
            yyerror("division by zero");
            YYABORT;
        } else {
            $$ = $1 / $3; 
        }
    }
    | factor           { $$ = $1; }
    ;

factor:
      NUMBER          { $$ = $1; }
    | LPAREN expr RPAREN { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter expressions to check validity. Ctrl+D to exit.\n");
    yyparse();
    return 0;
}
