## CSPC41 Compiler Design Project Assignment

# Compiler Design Project: Simulation of front-end phase of C Compiler involving switch-case construct.

Using lex/yacc implement a parser for managing the `switch` statement in a simplified version. 

## Steps

1. Run `flex switch.l` followed by:

    * `bison -dy switch.y`
    * `gcc yy.lex.c y.tab.c`
    * `a.exe < input.txt`

2. You could also run the shell script `./exe.sh` which generates the following files:
    * `lex.yy.c`
    * `y.tab.c`
    * `y.tab.h`
3.Give permissions to the `exe.sh` file if you get the message `exe.sh permission denied`:
    
    ```>>> chmod +x ./exe.sh ```
3. Run the parser and give it as input one of the files:

    ```>>> a.exe < input.txt```
 