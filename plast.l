%{
#include<stdio.h>
%}

%%
\<[^>]+\> {fprintf(yyout,"%s\n",yytext);}
.|\n

%%

int main(){
    extern FILE *yyin,*yyout;
    char input_file[100], output_file[100];

    printf("Enter html input file name:\n");
    scanf("%s", input_file);
    printf("Enter html output file name:\n");
    scanf("%s", output_file);

    yyin = fopen(input_file, "r"); // Corrected variable usage
    yyout = fopen(output_file, "w"); // Corrected variable usage

    yylex(); // Moved before closing files

    fclose(yyin);
    fclose(yyout);

    printf("Extracted HTML file %s\n", output_file);
    return 0;
}

int yywrap(){
    return 1;
}
