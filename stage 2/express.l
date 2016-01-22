%{
	#include <bits/stdc++.h>
	#include "express.hpp"
	#include "yacc.hpp"
	
	
	using namespace std;
	int number;
	int yyerror(string s);
%}

%%
[0-9]+ {number=atoi(yytext);yylval=makeleaf(number); return NUM;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
[\t] {}
[()] {return *yytext;}
"\n" {return END;}
. {yyerror("unknown character\n"); exit(1);}
%%

int yywrap(void){
	return 1;
}