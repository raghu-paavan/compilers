%{
	#include <bits/stdc++.h>
	#include "express.hpp"	
	#include "express.cpp"
	int yylex(void);
	using namespace std;
	int yyerror(string s);
%}

%token NUM PLUS MINUS MUL DIV END
%left PLUS MINUS
%left MUL DIV

%%

	program : expr END {
		$$=$2;
		cout<<evaluate($1)<<"\n";
		exit(1);
	}
	;

	expr : expr PLUS expr {$$=makeop('+',$1,$3);}
		 | expr MINUS expr {$$=makeop('-',$1,$3);}
		 | expr MUL expr {$$=makeop('*',$1,$3);}
		 | expr DIV expr {$$=makeop('/',$1,$3);}
		 | '(' expr ')' {$$=$2;}
		 | NUM {$$=$1;}
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