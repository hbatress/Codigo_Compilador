%{
#include <stdio.h>
int num_chars = 0;
%}

%%
\n ++num_chars;
. ++num_chars;
%%

int yywrap() {
    return 1; // Indica que no hay más archivos de entrada
}

int main()
{
    FILE* yyin;
    yyin = fopen("texto.txt", "r");
    yylex();
    printf("# of chars = %d\n", num_chars);
    fclose(yyin);
    return 0;
}
