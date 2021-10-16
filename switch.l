%{
    #include<stdio.h>
    #include "y.tab.h"
    void yyerror(char*);
%}

digit [0-9]

%%
[ \t\n]
switch    return SWITCH;
case return CASE;
break return BREAK;
default return DEFAULT;
{digit}+    return NUM;
[A-Za-z]([A-Za-z]|{digit})*    return ID;
.    return yytext[0];
%%

int yywrap(){
    return 1;
};