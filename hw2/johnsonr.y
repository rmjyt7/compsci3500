/*

  johnsonr.y

  Bison specification file.

  Grammar is:
    TODO: explain what the grammar is


*/

%{
#include <stdio.h>

int numLines = 0;

void printRule(const char *lhs, const char *rhs);
int yyerror(const char *s);
void printTokenInfo(const char* tokenType, const char* lexeme);

extern "C"  {
  int yyparse(void);
  int yylex(void);
  int yywrap() { return 1; }
}

%}

/* Token declarations */
%token T_IDENT T_INTCONST T_UNKNOWN T_FOO
/* TODO: add more tokens */

/* Starting point */
%start  N_START

/* Translation rules */
%%

N_START       : N_EXPR
                  {
                    printRule ("START", "EXPR");
                    printf("\n-- Completed parsing --\n\n");
                    return 0;
                  }
              ;
N_EXPR        : T_INTCONST
                  {
                    printRule("EXPR", "INTCONST");
                  }
              | T_IDENT
                  {
                    printRule("EXPR", "IDENT");
                  }
              | T_FOO N_IDENT_LIST N_INTCONST_LIST
                  {
                    printRule("EXPR", "foo IDENT_LIST INTCONST_LIST");
                  }
              ;
N_IDENT_LIST  : /* epsilon */
                  {
                    printRule("IDENT_LIST", "epsilon");
