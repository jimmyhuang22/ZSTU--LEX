%{
#include "stdio.h"
int lineNum;
%}
digit [0-9]+
keyword read|if|then|repeat|until|write|end
letter [a-zA-Z]+
comment \{[^\}]*\}
operator ":="|"="|"+"|"-"|"*"|"/"|">"|"<"
ignore  [" "|\t|\n]+
other [","|";"]+
%%
{comment} {
}
{digit} { printf("NUM,val= %s\n",yytext);
}
{keyword} { printf("reserved word：%s\n",yytext);
}
{letter} { printf("ID,name= %s\n",yytext);
}
{operator} { printf("%s\n",yytext);
}
{other} { printf("%s\n",yytext);
}
{ignore} {
	/*nothing*/
}
%%
int yywrap()
{
	return 1;
}
int main()
{
	lineNum = 0;
	yylex();
	return 0;

}
