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
[0-9]+             {  number=atoi(yytext); cout<<"returning "<<number<<"\n";yylval=makeleaf(number);return NUM;}
"+"                {return PLUS;}
"-"                {return MINUS;}
"*"                {return MUL;}
"/"                {return DIV;}
">"                {return GREATERTHAN;}
"<"                {cout<<"returning <\n";return LESSTHAN;}
";" 			   {cout<<"returning ;\n";return SEMICOLON;}
"=" 			   {cout<<"returning =\n";return ASSIGN;}
"=="               {cout<<"returning ==\n";return EQUAL;}
"read"             {cout<<"returning read\n";return READ;}
"write"            {cout<<"returning write\n";return WRITE;}
"if"               {cout<<"returning if \n";return IF;}
"then"             {cout<<"returning then \n";return THEN;}
"endwhlie"         {cout<<"returning endwhlie\n";return ENDWHILE;}
"while"            {cout<<"returning while\n";return WHILE;}
"do"               {cout<<"returning do\n";return DO;}
"endif"            {cout<<"returning endif\n";return ENDIF;}
[a-z]              {  c=*yytext;    cout<<"returning "<<c<<endl;       yylval=makeid(c); return ID; }
[\t]               {}
[()]               {cout<<"returning "<<*yytext<<" \n";return *yytext;}
"\n"               {return END;}
. {yyerror("unknown character\n"); exit(1);}
%%

int yywrap(void){
	return 1;
}