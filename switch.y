%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void yyerror(char* s);
void switchFn();
void caseFn(char* );
void breakFn();
void end();
char st[100][10];
int top = -1;
char temp[3] = "t0";
void print();
void push();
void defaultFn();
void printCase();
void end();
void gen_assign();
void indent();
void switchId();

int curIndentLevel = 0;

extern char* yytext;
%}


%token ID NUM SWITCH CASE DEFAULT BREAK INT
%right '='

%%
S       : ST {printf("Input accepted.\n");exit(0);}
        ;
ST      : SWITCH {switchFn();} '(' ID { switchId(); } ')' '{' B '}' { end(); }
        ;

B       : C
        | D
        ;

C       : CT B;

CT      : CASE NUM { push(); printCase(); } ':' E { breakFn(); caseFn(yytext); } ';' BREAK  ';'
        ;


D       : DEFAULT {defaultFn();} ':' E {breakFn();} ';' BREAK  ';'
        ;

E       : ID { push(); } '=' { push(); } NUM { push(); gen_assign(); }
        ;

%%

void push() {
        strcpy(st[++top],yytext);
}


void switchFn() {
        indent();
        printf("\nSWITCH: \n");
        curIndentLevel++;
}

void switchId() {
        push();
        indent();
        printf("%s := %s\n", temp, st[top]);
        top -= 1;
}

void printCase() {
        indent();
        printf("CASE%s:\n", st[top]);
        curIndentLevel++;
}

void caseFn(char *cur) {
        indent();
        printf("if %s == %s goto CASE%s\n", temp, cur, cur);
        top -= 1;
}

void breakFn() {
        indent();
        printf("goto END\n");
        curIndentLevel--;
}

void end() {
        curIndentLevel--;
        indent();
        printf("END: \n\tend of switch case\n");
}

void defaultFn() {
        indent();
        printf("DEFAULT:\n");
        curIndentLevel++;
}
void gen_assign(){
        indent();
        printf("%s = %s\n", st[top-2],st[top]);
        top -=3;
}

void indent() {
        int i;
        for (i = 0; i < curIndentLevel; i++) printf("\t");
}

main()
    {
    printf("Enter the exp: ");
    yyparse();
    }

void yyerror(char* s)
{
    exit(1);
}