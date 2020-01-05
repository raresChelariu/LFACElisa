%{
#include <stdio.h>
#include "functions.h"
extern FILE* yyin;
extern char* yytext;
extern int yylineno;

%}


%union { int val; char *nume; }

%type <val> NR expresie
%type <nume> ID

%token VAR PRINT NR ID BGIN END MAIN IF INT ELSE RETURN AND OR EQUAL GE LE GL THEN WHILE DO

%start program
%left '+' '-'
%left '*' '/'

%%

program: declaratii instructiuni 

declaratii:  declaratie ';'
    	   | declaratii declaratie ';'	
     	   ;

declaratie: VAR INT ID { if (verifdecl ($3) == -1) declarare ($3); else { yyerror(); printf ("Variabila a fost deja declarata \n"); }}
   	   | VAR INT ID '-' '>' NR { if (verifdecl ($3) == -1) initializare ($3, $6); else { yyerror(); printf ("Variabila a fost deja initializata \n"); }}
          ;
      
instructiuni: MAIN BGIN bloc END  
     	     ;
     
bloc: instructiune ';' 
    | bloc instructiune ';'
    ;

instructiune: ID '-' '>' expresie { if (verifdecl($1) == -1) { yyerror(); printf ("Variabila nu a fost declarata \n"); } else atribuire($1, $4); }
            | PRINT '(' NR ')' 
            | PRINT '(' ID ')' 
            | instrIF
            | instrWHILE
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
              | expresieWHILE
              ;

expresieWHILE: expresie  EQUAL  expresie
             | expresie  LE  expresie
             | expresie  GE  expresie
             | expresie  GL  expresie
             ;

expresie: expresie '+' expresie { $$ = $1 + $3; }
	 | expresie '-' expresie { $$ = $1 - $3; }
	 | expresie '*' expresie { $$ = $1 * $3; }
	 | expresie '/' expresie { $$ = $1 / $3; }
        | NR { $$ = $1; }
        | ID { $$ = $1; }
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