flex switch.l
bison -dy switch.y
gcc -o yy.lex.c y.tab.c -ll