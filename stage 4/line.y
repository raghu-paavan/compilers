%{
	#include <bits/stdc++.h>
	using namespace std;
	#include "line.hpp"	
	int memory[26];
	#include "line.cpp"
	int yylex(void);
	int yyerror(string s);
%}

%token NUM PLUS MINUS MUL DIV END ID ASSIGN READ WRITE SEMICOLON LESSTHAN GREATERTHAN EQUAL IF THEN  ENDIF WHILE DO ENDWHILE
%left PLUS MINUS
%left MUL DIV
%right ASSIGN
%nonassoc LESSTHAN GREATERTHAN EQUAL

%%

	program: slist END {final($1);exit(0);}
			;

	slist : stmt slist {$$=make_internal_node($2,$1);}
			| stmt  {$$=$1;}
			;

	stmt : 	ID ASSIGN expr SEMICOLON {$$=makeop('=',$1,$3);}
			| READ '(' ID ')' SEMICOLON {$$=readnode($3->op);}
			| WRITE '(' expr ')' SEMICOLON {$$=writenode($3);}
			| IF '(' expr ')' THEN slist  ENDIF SEMICOLON {$$=makecond(1,$3,$6);}
			| WHILE '(' expr ')' DO  slist ENDWHILE SEMICOLON {$$=makecond(2,$3,$6);}
			;

	expr : expr PLUS expr {$$=makeop('+',$1,$3);}
		 | expr MINUS expr {$$=makeop('-',$1,$3);}
		 | expr MUL expr {$$=makeop('*',$1,$3);}
		 | expr DIV expr {$$=makeop('/',$1,$3);}
		 | '(' expr ')' {$$=$2;}
		 | '(' expr LESSTHAN expr ')' {$$=makeop('<',$2,$4);}
		 | '(' expr GREATERTHAN expr ')' {$$=makeop('>',$2,$4);}
		 | expr EQUAL expr  {$$=makeop('@',$1,$3);}
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
//c=6;read(d);write(c+d);if(c-2)thenread(e);while(e>0)dowrite(e);e=e-1;endwhile;endif;
//if(2+3)thenwrite(123);endif;
//