%{
    #include<stdio.h>
%}

%%
[0-9]*[02468] {printf("number is even :%s\n",yytext);}
[0-9]*[13579] {printf("number is odd :%s\n",yytext);}
%%

int main(){
    printf("Enter the number: \n");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}