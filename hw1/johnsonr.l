/***  Robert Johnson
      CS3500
      Homework #1
      8/23/17
      Filename: johnsonr.l ***/

%{
/* Definitions of constants, variables, & function prototypes go here */

#define T_IDENT   1
#define T_INTCONST  2
#define T_UNKNOWN   3
#define T_FOO       4
#define T_LAMBDA    5

int numLines = 0;

void printTokenInfo(const char* tokenType, char* lexeme);

%}

/* Defintions of regular expressions go here */

WSPACE    [ \t\v\r]+
NEWLINE           \n

DIGIT             [0-9]
LETTER            [a-zA-Z]

IDENT     {LETTER}({LETTER}|{DIGIT})*
INTCONST          (-|\+)*{DIGIT}+
COMMENT           ;(.*)
STRCONST          \"(.*)\"

%%

"foo"             {
        printTokenInfo("FOO", yytext);
        return T_INTCONST;
     }
"lambda"             {
        printTokenInfo("LAMBDA", yytext);
        return T_LAMBDA;
      }
"print"              {
        printTokenInfo("PRINT", yytext);
        return T_INTCONST;
      }
"nil" {
        printTokenInfo("NIL", yytext);
        return T_INTCONST;
      }
"and" {
        printTokenInfo("AND", yytext);
        return T_INTCONST;
      }
"or"  {
        printTokenInfo("OR", yytext);
        return T_INTCONST;
      }
"not" {
        printTokenInfo("NOT", yytext);
        return T_INTCONST;
      }
"if"                 {
        printTokenInfo("IF", yytext);
        return T_INTCONST;
      }
"_underscore_this"   {
        printTokenInfo("IDENT", yytext);
      }
"let*"            {
        printTokenInfo("LETSTAR", yytext);
        return T_INTCONST;
      }
"input"           {
        printTokenInfo("INPUT", yytext);
        return T_INTCONST;
      }
"("               {
        printTokenInfo("LPAREN", yytext);
        return T_INTCONST;
      }
")"               {
        printTokenInfo("RPAREN", yytext);
        return T_INTCONST;
      }
"- "               {
        printTokenInfo("SUB", yytext);
        return T_INTCONST;
      }
"+ "               {
        printTokenInfo("ADD", yytext);
        return T_INTCONST;
      }
"*"               {
        printTokenInfo("MULT", yytext);
        return T_INTCONST;
      }
"/="  {
        printTokenInfo("NE", yytext);
        return T_INTCONST;
      }
"/"               {
        printTokenInfo("DIV", yytext);
        return T_INTCONST;
      }
"t"                {
        printTokenInfo("T", yytext);
        return T_INTCONST;
      }
"<="  {
        printTokenInfo("LE", yytext);
        return T_INTCONST;
      }
">="  {
        printTokenInfo("GE", yytext);
        return T_INTCONST;
      }
"<"   {
        printTokenInfo("LT", yytext);
        return T_INTCONST;
      }
">"   {
        printTokenInfo("GT", yytext);
        return T_INTCONST;
      }
"="   {
        printTokenInfo("EQ", yytext);
        return T_INTCONST;
      }
{COMMENT}         {
        return T_INTCONST;
}
{STRCONST}        {
        printTokenInfo("STRCONST", yytext);
        return T_INTCONST;
      }
{INTCONST}        {
        printTokenInfo("INTCONST", yytext);
        return T_INTCONST;
      }
{IDENT}   {
        printTokenInfo("IDENT", yytext);
        return T_IDENT;
      }
{NEWLINE}   {
                        numLines++;
                  }
{WSPACE}    { }
.     {
        printTokenInfo("UNKNOWN", yytext);
        return T_UNKNOWN;
      }

%%

// User-written code goes here

void printTokenInfo(const char* tokenType, char* lexeme) {
  printf("TOKEN: %s  LEXEME: %s\n", tokenType, lexeme);
}

// You should supply a yywrap function.
// Having it return 1 means only 1 input file will be scanned.
int yywrap(void) { return 1; }

int main(void) {
  while ( yylex() ) ;  // Keep processing tokens until 0 returned

  printf("Processed %d lines\n", numLines);
  return 0;
}

