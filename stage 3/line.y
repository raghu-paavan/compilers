%{
	#include <bits/stdc++.h>
	using namespace std;
	#include "line.hpp"	
	int memory[26];
	#include "line.cpp"
	int yylex(void);
	
	int yyerror(string s);
%}

%token NUM PLUS MINUS MUL DIV END ID ASSIGN READ WRITE SEMICOLON
%left PLUS MINUS
%left MUL DIV
%right ASSIGN

%%

	program: slist END {final($1);exit(0);}
			;

	slist : stmt slist {$$=make_internal_node($2,$1);}
			| stmt  {$$=$1;}
			;

	stmt : 	ID ASSIGN expr SEMICOLON {$$=makeop('=',$1,$3);}
			| READ '(' ID ')' SEMICOLON {$$=readnode($3->op);}
			| WRITE '(' expr ')' SEMICOLON {$$=writenode($3);}
			;

	expr : expr PLUS expr {$$=makeop('+',$1,$3);}
		 | expr MINUS expr {$$=makeop('-',$1,$3);}
		 | expr MUL expr {$$=makeop('*',$1,$3);}
		 | expr DIV expr {$$=makeop('/',$1,$3);}
		 | '(' expr ')' {$$=$2;}
		 | NUM {$$=$1;}
		 | ID {$$=$1;}
		 ;
%%

int yyerror(string s)
{
	cout<<s;
	return 0;
}

int main()
{
	yyparse();
	return 0;
}
//a=3;b=5;write(a+b);