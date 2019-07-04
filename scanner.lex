%{
#include <stdio.h>
#include "parser.h"
#include "parser.tab.hpp"
int yyerror(const char * message);
%}

%option yylineno
%option noyywrap

whitespace	([\t\n\r ])

%%
void                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"VOID") ; return VOID; }
int                                 {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"INT") ; return INT; }
byte                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"BYTE") ; return BYTE; }
b                                   {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"B") ; return B; }
bool                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"BOOL") ; return BOOL; }
and                                 {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"AND") ; return AND; }
or                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"OR") ; return OR; }
not                                 {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"NOT") ; return NOT; }
true                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"TRUE") ; return TRUE; }
false                               {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"FALSE") ; return FALSE; }
return                              {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"RETURN") ; return RETURN; }
if                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"IF") ; return IF; }
else                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"ELSE") ; return ELSE; }
while                               {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"WHILE") ; return WHILE; }
break                               {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"BREAK") ; return BREAK; }
continue                            {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"CONTINUE") ; return CONTINUE; }
@pre                                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"PRECOND") ; return PRECOND; }
\;                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"SC") ; return SC; }
\,                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"COMMA") ; return COMMA; }
\(                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"LPAREN") ; return LPAREN; }
\)                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"RPAREN") ; return RPAREN; }
\{                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"LBRACE") ; return LBRACE; }
\}                                  {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"RBRACE") ; return RBRACE; }
=                                   {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"ASSIGN") ; return ASSIGN; }
==|!=|<|>|<=|>=                     {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"RELOP") ; return RELOP; }
\*|\/                         {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"BINOP") ; return BINOP1; }
\+|\-                         {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"BINOP") ; return BINOP2; }
[a-zA-Z][a-zA-Z0-9]*                {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"ID") ; return ID; }
0|[1-9][0-9]*                       {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"NUM") ; return NUM; }
\"([^\n\r\"\\]|\\[rnt"\\])+\"       {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"STRING") ; return STRING; }
\/\/[^\r\n]*[\r|\n|\r\n]?           ;
{whitespace}*                       ;
  MY_EXIT                           {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"EF") ; return EF; }
.                                   {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; yyerror("lexical error");}
<<EOF>>                             {yylval.line = yylineno ; strcpy(yylval.val,yytext) ; strcpy(yylval.token,"EF") ; return EF; }
%%

