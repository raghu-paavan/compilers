%{
	#include <iostream>
	#include "eval.hpp"
%}

digit [0-9]+
plus ['+']
minus [-]
mul ['*']
div ['/']
open ['(']
close [')']	
comma	[',']
newline ['\n']

%%

{digit}		{ yylval = atoi(yytext); return DIGIT;}
{minus}     {return *yytext;}
{plus}		{return *yytext;}
{div}		{return *yytext;}
{mul}		{return *yytext;}
{open}		{return *yytext;}
{close}		{return *yytext;}
{comma}		{return *yytext;}
{newline}		{return *yytext;}
%%

int yywrap()
{
	return 1;
}
