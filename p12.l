%{
#include <stdio.h>

int state = 0; // Start at S0
%}

%%

a  {
    switch (state) {
        case 0: state = 1; break;
        case 1: state = 0; break;
        case 2: state = 3; break;
        case 3: state = 2; break;
    }
}

b  {
    switch (state) {
        case 0: state = 2; break;
        case 1: state = 3; break;
        case 2: state = 0; break;
        case 3: state = 1; break;
    }
}

[^ab\n] { printf("Invalid character: %s\n", yytext); }
\n      {
    if (state == 0)
        printf("Accepted: Even number of a's and b's\n");
    else
        printf("Rejected: Not even number of a's and b's\n");
    state = 0; // reset for next line
}

%%

int main() {
    printf("Enter strings over {a, b} (press Enter after each):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
