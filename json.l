%{
    #include "json.tab.h"    
%}

%option noyywrap
%option outfile = "json.lex.c"

ANYTHING .*
STRING \"[a-zA-Z0-9]*\"

DIGIT [0-9]
NUMBER ([1-9]{DIGIT}*|"0")
INTEGER -?{NUMBER}
REALNUMBER -?{NUMBER}"\."{DIGIT}+

OPENHOOK \{
CLOSEHOOK \}

OPENBRACKET \[
CLOSEBRACKET \]

SEMICOLON :
COMMA \,

INLINECOMMENT \/\/{ANYTHING}

%%


{INTEGER} {
    printf(" INTEGER");
    return INTEGER;
}

{REALNUMBER} {
    printf(" REALNUMBER");
    return REALNUMBER;
}


{STRING} {
    printf(" STRING");
    return STRING;
} 


{OPENBRACKET} {
    printf(" OPENBRACKET");
    return OPENBRACKET;
    
}

{CLOSEBRACKET} {
    printf(" CLOSEBRACKET");
    return CLOSEBRACKET;
    
}
{OPENHOOK} {
    printf(" OPENHOOK");
    return OPENHOOK;
}

{CLOSEHOOK} {
    printf(" CLOSEHOOK");
    return CLOSEHOOK;    
}

{COMMA} {
    printf(" COMMA");
    return COMMA;
}

{SEMICOLON} {
    printf(" SEMICOLON");
    return SEMICOLON;
}


\n {;}

{INLINECOMMENT} {;}

[ \t]+ {;}

. {
    printf("Unrecognized character");
    yyterminate();
}

%%
