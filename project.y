%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int digito, count, pcount=0,i,j,num,r;
char hex[20];
int octal[8],bin[100];
int digit[]={10000,9000,5000,4000,1000,900,500,400,100,90,50,40,10,9,5,4,1,0};
char *cant[]={"P","MP","G","MG","M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I","Z"};
extern int yylex(void);
extern char *yytext;
extern FILE *yyin;
void yyerror(char *s);
%}
%union {float real;}
%start E
%token TKN_ASIGN
%token <real> TKN_NUMERO
%token TKN_PA
%token TKN_PC
%token TKN_MAS
%token TKN_MENOS
%token TKN_MULT
%token TKN_DIV
%token TKN_ELE
%token TKN_RAIZ
%token TKN_LOG
%token TKN_EXP
%token TKN_SEN
%token TKN_COS
%token TKN_TAN
%token TKN_PTOCOMA
%type<real>Expresion
%type<real>E
%type<real>R
%left TKN_MAS  TKN_MENOS
%left TKN_MULT TKN_DIV
%left TKN_EXP TKN_LOG
%right TKN_ELE TKN_RAIZ
%left TKN_PA TKN_PC
%%
E:	E R {printf("\nINGRESE SECUENCIA ROMANO:\n");}|
	 R {printf("\nINGRESE SECUENCIA ROMANO:\n");};
R:	TKN_ASIGN  Expresion TKN_PTOCOMA {
	if($2 > 30000 || $2 < -30000 ){printf("\nEl resultado excede el rango de la calculadora\nEl rango va desde -30000 hasta 30000");}
	else{
	num=$2;
	printf("\nEl valor en romano es: ");
	if(num<0){printf("-"); num=-num;}
   	if(num==0)    {printf("%s",cant[17]);}
	i=0;
	while(num>0){
		if(num>=digit[i]){
			printf("%s",cant[i]);
			num=num-digit[i];
		}else{i=i+1;}
	}i=0;
	num=$2;
	if(num<0){}else{ 
	printf("\nEl valor binario es: ");
	if(num==0){
		printf("%d",num);
        }else{
		while(num>0){
                bin[i]=num%2;
                num=num/2;
                i++;
        	}
        	for(j=i-1;j>=0;j--)
        		printf("%d", bin[j]);
	      	i=0;}
	printf("\nEl valor hexadecimal es: ");
        num=$2;
        if(num==0)
        	printf("0");
        while(num!=0){
        	r=num%16;
               	digito='0'+r;
               	if(digito>'9')
                	  digito+=7;
              	 hex[count++]=digito;
              	 num=num/16;
        }
        for(i=count-1;i>=pcount;--i)
        	printf("%c", hex[i]);
        pcount=count;
       	i=0;
        num=$2;
        printf("\nEl valor octal es: ");
        while(num>=8){
	        octal[i]=num%8;
        	num=num/8;
               	i++;
        }
        octal[i]=num;
        for(j=i;j>=0;j--)
        	printf("%d", octal[j]);
	i=0;}}
	printf("\nEl valor decimal es: %4.2f\n",$2);
        };
Expresion:	TKN_NUMERO {$$=$1;}|
	TKN_MENOS Expresion		{$$=-$2;}|
	Expresion TKN_MAS  Expresion	{$$=$1+$3;}|
	Expresion TKN_MENOS Expresion   {$$=$1-$3;}|
	Expresion TKN_MULT Expresion    {$$=$1*$3;}|
	Expresion TKN_DIV  Expresion   	{if($3!=0){$$=$1/$3;}else
{printf("\nNo existe division para cero\n");return yyparse();}}|
	Expresion TKN_ELE Expresion	{$$=pow($1,$3);}|
	TKN_RAIZ TKN_PA Expresion TKN_PC{$$=sqrt($3);}|
	TKN_COS TKN_PA Expresion TKN_PC {$$=cos($3);}|
        TKN_SEN TKN_PA Expresion TKN_PC {$$=sin($3);}|
	TKN_TAN TKN_PA Expresion TKN_PC {$$=tan($3);}|
	TKN_EXP TKN_ELE Expresion 	{$$=exp($3);}|
        TKN_LOG TKN_PA Expresion TKN_PC {if($3>=1){$$=log($3);}else
{printf("\nNo existe el logaritmo\n");}}|
	TKN_PA Expresion TKN_PC		{$$=$2;};
%%
void yyerror(char *s){
	fprintf(stdout, "\n%s\n", s);
}

int main(){
	printf("CALCULADORA NUMEROS ROMANOS\n");
	printf("INGRESE SECUENCIA ROMANO:\n");
	yyparse();
	return 0;
}
