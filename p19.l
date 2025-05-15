%{
#include"y.tab.h"
%}

%%
[0-9]+  {yylval = atoi(yytext);return NUMB;}
[\t]+ {   }
[\n]    {return '\n';}
[+-/*]  {return yytext[0];}
%%

int yywrap(){
    return 1;
}
