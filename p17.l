%{
#include "y.tab.h"
%}

digit   [0-9]+

%%

{digit}     { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
{return DIV}
"/"
"("         { return LP; a}
")"         { return RP; }
[ \t\n]     ;   // Ignore whitespace
.           { return yytext[0]; } // catch all for invalid characters
%%
