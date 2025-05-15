%{
#include<stdio.h>
int lines = 0,spaces = 0,tabs = 0,chars = 0;
%}

%%
\n	{lines++;}
" "	{spaces++;}
\t	{tabs++;}
.	{chars++;}
%%

int main (){
printf("Enter the Input(Ctrl+D to end):\n");
yylex();
printf("\nThe No of Lines are : %d\n",lines);
printf("\nThe No of spaces are : %d\n",spaces);
printf("\nThe No of tabs are : %d\n",tabs);
printf("\nThe No of Remaining Characters are : %d\n",chars);
return 0;
}
int yywrap(){
return 1;
}
