%{
	#include <bits/stdc++.h>
	#include "line.hpp"
	#include "yacc.hpp"
	using namespace std;
	int number;
	char c;
	int yyerror(string s);
%}

%%
[0-9]+ {  number=atoi(yytext); yylval=makeleaf(number);return NUM;}
[a-z]  {  c=*yytext;           yylval=makeid(c); return ID; }
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
";" {return SEMICOLON;}
"=" {return ASSIGN;}
"read" {return READ;}
"write" {return WRITE;}
[\t] {}
[()] {return *yytext;}
"\n" {return END;}
. {yyerror("unknown character\n"); exit(1);}
%%

int yywrap(void){
	return 1;
}