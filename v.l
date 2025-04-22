%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]*   { printf("Valid String\n"); }
.                        { printf("Invalid String\n"); }
%%

int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
    
}