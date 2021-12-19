%{
    #include <stdio.h>
    void yyerror(char *s);
    extern int yylex();
%}

%token OPENHOOK "{"
%token CLOSEHOOK "}"
%token OPENBRACKET "["
%token CLOSEBRACKET "]"
%token SEMICOLON ":"
%token COMMA ","

%token STRING
%token INTEGER
%token REALNUMBER


/* %left OPENHOOK CLOSEHOOK
%left OPENBRACKET CLOSEBRACKET
%left COMMA */

%%


object : "{" eps_pairs "}" {printf("\nYour json file is valid\n");}
        ;

eps_pairs: // nothing
        | pairs
        ;

pairs: pair comma_pairs

comma_pairs:
            | "," pairs
            ;

pair : STRING ":" value

value : STRING 
    | INTEGER 
    | REALNUMBER 
    | object 
    | array
    ;

array: "[" eps_values "]"

eps_values: // eps
        | values
        ;
        
values: value comma_values

comma_values: // eps
            | "," values
            ;
%%


void yyerror(char *s){
    printf("%s\n", s);
}

int main(){
    yyparse();
}