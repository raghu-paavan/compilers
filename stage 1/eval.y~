%{
	#include<bits/stdc++.h>	
	using namespace std;
	int  yylex();
	int yyerror(string s);
%}

%token DIGIT

%left '+' '-'
%left '*'
%left '/'

%%

start : expr '\n'  { cout<<$1<<endl;exit(1);}
	;

expr:  expr '+' expr		{$$ = $1 + $3;}
	| expr '-' expr		{$$ = $1 - $3;}
	| expr '*' expr		{$$ = $1 * $3;}
	| expr '/' expr		{$$ = $1 / $3;}
	| '(' expr ')'	 	{$$ = $2;}
	| DIGIT			{$$ = $1;}
	;

%%

int yyerror(string s)
{
	cout<<"error\n";
	return 1;
}

int main()
{
	yyparse();
	return 1;
}
