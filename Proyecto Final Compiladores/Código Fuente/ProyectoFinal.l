%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

%}
PAL_RES_VAR int|float|double
PAL_RES_LET let
PAL_RES_ARRAY Array
PAL_RES_FOR for
PAL_RES_THINGS Things
PAL_RES_LENG length
PAL_RES_EACH each
PAL_RES_array array
PAL_RES_FUNCTION function
PAL_RES_KEY key
PAL_RES_VALUE value
PAL_RES_CONSOLE console.log
PAL_RES_WHILE while
LETRAS [a-zA-z_]
NUMERO [0-9]
MAYOR_QUE [">"]
MENOR_QUE ["<"]
PARA ["("]
PARC [")"]
CORA ["["]
CORCE ]
SIMBDOL ["$"]
LLAVEA ["{"]
LLAVEC ["}"]
NOIGUAL ["!"]
MAS ["+"]
MENOS ["-"]
DIV ["/"]
POR ["*"]
IGUAL ["="]
AND ["&&"]
OR ["||"]
PUNTO ["."]
DOSPUNTOS [":"]
ELEVADO ["^"]
FIN_DL [";"]
APOST ["'"]
COMA [","]
COMILLA ["""]
%%
"int" {fprintf(yyout, "var");} 
"char" {fprintf(yyout, "var");} 
"float" {fprintf(yyout, "var");} 
"double" {fprintf(yyout, "var");} 
"cout<<" {fprintf(yyout, "console.log(");}
"<<endl;" {fprintf(yyout, ")");}  
";" {fprintf(yyout, "");}
"; i" {fprintf(yyout, "; i");}
"<<" {fprintf(yyout, "+");} 


.       { fprintf(yyout, "%s", yytext); }
%%
  
int yywrap()
{
}
main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("archivo_entrada.txt", "r");
    yyout = fopen("archivo_salida.txt", "w");
    yylex();
    return 0;
}