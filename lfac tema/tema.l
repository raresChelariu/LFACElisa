%{
#include <stdio.h>
#include "y.tab.h"
#include<string.h>
%}

%option noyywrap

%%

int { return INT; }
main { return MAIN; }
var { return VAR; }
begin { return BGIN; }
print { return PRINT; }
if { return IF; }
then { return THEN; }
else { return ELSE; }
while { return WHILE; }
do { return DO; }
and { return AND; }
or { return OR; }
equal { return EQUAL; }
le { return LE; }
gl { return GL; }
ge { return GE; }
end { return END; }
[a-zA-Z][a-zA-Z]* { yylval.nume = strdup(yytext); return ID; }
[0-9][0-9]* { yylval.val = atoi(yytext);return NR; }
[ \t\f]+ ;
"\r\n"|"\n" {yylineno++;}
. {return yytext[0];}

%%