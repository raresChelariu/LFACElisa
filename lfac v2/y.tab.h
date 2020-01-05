/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VAR = 258,
    PRINT = 259,
    NR = 260,
    RETURN = 261,
    ID = 262,
    BGIN = 263,
    END = 264,
    MAIN = 265,
    IF = 266,
    CLASS = 267,
    INTERN = 268,
    EXTERN = 269,
    INT = 270,
    ELSE = 271,
    RETRN = 272,
    AND = 273,
    OR = 274,
    EQUAL = 275,
    GE = 276,
    LE = 277,
    GL = 278,
    THEN = 279,
    WHILE = 280,
    DO = 281,
    CHAR = 282,
    BOOL = 283,
    FLOAT = 284,
    NRFLOAT = 285,
    FALSE = 286,
    TRUE = 287
  };
#endif
/* Tokens.  */
#define VAR 258
#define PRINT 259
#define NR 260
#define RETURN 261
#define ID 262
#define BGIN 263
#define END 264
#define MAIN 265
#define IF 266
#define CLASS 267
#define INTERN 268
#define EXTERN 269
#define INT 270
#define ELSE 271
#define RETRN 272
#define AND 273
#define OR 274
#define EQUAL 275
#define GE 276
#define LE 277
#define GL 278
#define THEN 279
#define WHILE 280
#define DO 281
#define CHAR 282
#define BOOL 283
#define FLOAT 284
#define NRFLOAT 285
#define FALSE 286
#define TRUE 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "tema.y" /* yacc.c:1909  */
 int val; char *nume; float fval; 

#line 121 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
