%{
#include <stdio.h>
#include "functions.h"
extern FILE* yyin;
extern char* yytext;
extern int yylineno;

%}


%union { int val; char *nume; float fval; }

%type <val> NR expresie
%type <nume> ID
%type <fval> NRFLOAT

%token VAR PRINT NR RETURN ID BGIN END MAIN IF CLASS INTERN EXTERN INT ELSE RETRN AND OR EQUAL GE LE GL THEN WHILE DO CHAR BOOL FLOAT NRFLOAT FALSE TRUE

%start program
%left '+' '-'
%left '*' '/'

%%

program: clase functii declaratii instructiuni 

clase: clasa ';'
     | clase clasa ';'
     ;

clasa: CLASS ID '{' corpclasa '}'
     ;

corpclasa: INTERN varinterne EXTERN varexterne
         ;

varinterne: declaratii
          ;

varexterne: declaratii
          ;

functii: functie 
       | functii functie 
       ;

functie: ID '(' argumente ')' '-' '>' vartype '{' bloc '}' ';'
       ;

argumente: vartype ID 
         | vartype ID ',' argumente
         ;

declaratii:  declaratie ';'
    	   | declaratii declaratie ';'	
     	   ;

declaratie: VAR vartype ID { if (verifdecl ($3) == -1) declarare ($3); else { yyerror(); printf ("Variabila a fost deja declarata \n"); }}
   	   | VAR vartype ID '-' '>' NR { if (verifdecl ($3) == -1) initializareINT ($3, $6); else { yyerror(); printf ("Variabila a fost deja initializata \n"); }}
          | VAR vartype ID '-' '>' NRFLOAT
          | VAR vartype ID '[' NR ']' 
          | VAR vartype ID '[' NR ']' '-' '>' '{' ids '}'
          ;

ids: '\'' ID '\''
   | NR
   | NRFLOAT
   | NRFLOAT ',' ids
   | '\'' ID '\'' ',' ids
   | NR ',' ids
   ;

vartype: INT
       | CHAR
       | FLOAT
       | BOOL
       ;
      
instructiuni: MAIN BGIN bloc END  
     	     ;
     
bloc: instructiune 
    | instructiune bloc
    ;

instructiune: ID '-' '>' expresie  ';'{ if (verifdecl($1) == -1) { yyerror(); printf ("Variabila nu a fost declarata \n"); } else atribuireINT($1, $4); }
            | ID '[' NR ']' '-' '>' expresie ';'
            | PRINT '(' NR ')' ';'
            | PRINT '(' ID ')' ';'
            | instrIF ';'
            | instrWHILE ';'
            | RETRN ID ';'
            | RETRN NR ';'
            | RETRN NRFLOAT ';'
            | RETRN BOOL ';'
            ;

instrIF: IF '(' listaexprIF ')' THEN '{' bloc '}' 
       | IF '(' listaexprIF ')' THEN '{' bloc '}' ELSE '{' bloc '}'
       ;

listaexprIF: expresieIF AND listaexprIF
           | expresieIF OR listaexprIF
           | expresieIF
           ;

expresieIF: expresie  EQUAL  expresie
          | expresie  LE  expresie
          | expresie  GE  expresie
          | expresie  GL  expresie
          ;

instrWHILE: WHILE '(' listaexprWHILE ')' DO '{' bloc '}'
          ;
         
listaexprWHILE: expresieWHILE AND listaexprWHILE
              | expresieWHILE OR listaexprWHILE
              | expresieWHILE { printf("gata aici\n"); }
              ;

expresieWHILE: expresie  EQUAL  expresie { printf("gata si aici\n"); }
             | expresie  LE  expresie
             | expresie  GE  expresie
             | expresie  GL  expresie
             ;

expresie: expresie '+' expresie { $$ = $1 + $3; }
	 | expresie '-' expresie { $$ = $1 - $3; }
	 | expresie '*' expresie { $$ = $1 * $3; }
	 | expresie '/' expresie { $$ = $1 / $3; }
        | NR { $$ = $1; }
        | NRFLOAT { $$ = $1; }
        | ID { $$ = $1; }
        | '\'' ID '\'' { $$ = $2; }
        ;

%%

int yyerror(char * s)
{
  printf("\n!!!  eroare: %s la linia:%d\n",s,yylineno);
}



int main(int argc, char** argv)
{
  yyin=fopen(argv[1],"r");
  yyparse();
}