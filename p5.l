%{ 
#include<stdio.h> 
%}

%% 
"int"|"float"|"char"|"if"|"else"|"while"|"return" {printf("KEYBOARD: ,%s\n",yytext);} 
[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext);} 
[0-9]* {printf("CONSTANT: %s\n",yytext);} 
[+\-*/=] {printf("OPERATORS: %s\n",yytext);} 
[,;] {printf("SEPARATORS: %s\n",yytext);} 
%%
 
int main(){ 
printf("enter code to tokenize :"); 
yylex(); 
return 0; 
}

int yywrap(){ 
return 1; 
}
