%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "y.tab.h"
int num[]={10000, 5000, 1000, 500, 100, 50, 10, 5, 1, 0 };
char cadena[]= "PGMDCLXVIZ";
char mayus;
int resultado=0, i=0,j=0, ultimov=0;
%}
numero (z|Z)*((P|p){0,3}((MP|mp|Mp|mP)|(MG|mg|Mg|mG)|(G|g)?(M|m){0,3})((CM|cm|Cm|cM)|(CD|cd|Cd|cD)|(D|d)?(C|c){0,3})((XC|xc|Xc|xC)|(XL|xl|Xl|xL)|(L|l)?(X|x){0,3})((IX|ix|Ix|iX)|(IV|iv|Iv|iV)|(V|v)?(I|i){0,3}))
abrir ("["|"("|"{")
cerrar ("]"|")"|"}")
ope ("+"|"-"|"*"|"/"|"^")
num [0-9]
%%
"="			{printf("La operacion es:  total = ");return(TKN_ASIGN);}
";"			{return(TKN_PTOCOMA);}
"+"			{printf(" + ");return(TKN_MAS);}
"-"                     {printf(" - ");return(TKN_MENOS);}
"*"                     {printf(" * ");return(TKN_MULT);}
"/"                     {printf(" / ");return(TKN_DIV);}
"^"                     {printf(" ^ ");return(TKN_ELE);}
"sqr"			{printf(" sqr ");return(TKN_RAIZ);}
"ln"			{printf(" ln ");return(TKN_LOG);}
"e"			{printf(" e ");return(TKN_EXP);}
"sen"			{printf(" sen ");return(TKN_SEN);}
"cos"			{printf(" cos ");return(TKN_COS);}
"tan"			{printf(" tan ");return(TKN_TAN);}
{abrir}                 {printf("%s ",yytext);return(TKN_PA);}
{cerrar}                {printf(" %s",yytext);return(TKN_PC);}
{numero}		{resultado=0; ultimov=0;
			while(i<yyleng){
				mayus  = toupper(yytext[i]);
				const char *ptr = strchr(cadena, mayus);
				if (ptr) {j=ptr-cadena;}
				if(j>=0){resultado+=num[j];
					if (num[j] > ultimov){
						resultado-=2*ultimov;}
					ultimov = num[j];
				}i++;
			}i=0;
			printf("%s",yytext);
			yylval.real=resultado;
			return(TKN_NUMERO);}
{numero}{numero}+    	{printf("\n Numero Romano no Valido: %s \n", yytext);}
{ope}{ope}+    		{printf("\n Operador no Valido: %s \n", yytext);}
{abrir}{cerrar}    	{printf("\n Acotador no Valido: %s \n", yytext);}   
{numero}*{num}+{numero} {printf("\n Secuencia no valida: %s \n", yytext);}
[A-Za-z]+     		{printf("\n Secuencia no valida: %s \n", yytext);}
.	 		{printf("\n El caracter no es valido: %s\n", yytext);}
%%
