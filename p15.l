%{
#include <stdio.h>
%}

%s START BODY DEAD

%%

<INITIAL>a    { BEGIN(START); /* first char is 'a', good */ }

<INITIAL>[b\n] { /* if first char is b or newline */ 
    if(yytext[0] == '\n') BEGIN(INITIAL);
    else { BEGIN(DEAD); }
}

<START>[ab]   { BEGIN(BODY); }   // after reading first 'a', we move to BODY on next chars

<BODY>[ab]    { /* stay in BODY */ }

<BODY>\n      { 
    // check last character before \n is 'b' to accept
    if (yytext[-2] == 'b') 
        printf("Valid string (starts with a, ends with b)\n");
    else 
        printf("Invalid string (does not end with b)\n");
    BEGIN(INITIAL);
}

<DEAD>[^\n]*\n { 
    printf("Invalid string\n"); 
    BEGIN(INITIAL); 
}

.|\n          { /* ignore any other chars or newlines */ }

%%

int main() {
    printf("Enter strings over {a,b} (one per line):\n");
    BEGIN(INITIAL);
    yylex();
    return 0;
}

int yywrap() { return 1; }
