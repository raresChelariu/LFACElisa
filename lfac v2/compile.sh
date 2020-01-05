yacc -d tema.y
lex tema.l
gcc lex.yy.c y.tab.c -ly -o tema

