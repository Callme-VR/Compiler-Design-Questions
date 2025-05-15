%{
#include "y.tab.h"
#include <stdlib.h>
%}



%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }
"("         { return LP; }
")"         { return RP; }
.           { return yytext[0]; }

%%
