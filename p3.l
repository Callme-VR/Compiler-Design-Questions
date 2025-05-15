%{
#include<stdio.h>
%}

%%

[.][0-9]*	{printf("This is a floating Point Number\n");}
[0-9]*[.][0-9]* {printf("This is a floating Point Number\n");}
[0-9][0-9]*	{printf("This is an Integer Number\n");}
[a-zA-Z0-9" "\t\b\r]*	{printf("NOT a Valid Number\n");}
%%

int main (){
printf("Enter Input (Ctrl+D to end):\n");
yylex();
return 0;}
int yywrap(){
return 1;}
