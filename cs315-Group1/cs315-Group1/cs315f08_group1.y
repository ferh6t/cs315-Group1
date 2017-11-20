/* AFS.y */

%{
#include <stdio.h>
%}

%token WHILE RETURN PRINTOF SCANNER CONSTANT BOOL
%token IF ELSEIF ELSE IFANDONLYIF IMPLIES AND OR ASSIGN XOR  
%token COLON SEMICOLON PLUS MINUS DIVIDE MULTIPLY
%token DOT COMMA EQUALITY EQUAL NOTEQUAL
%token LESSTHAN GREATERTHAN POWER NAND NOR LP RP LB RB LSQB RSQB
%token ID DOLLAR NOT NL
%token TRUE
%token FALSE
%token STRING INT FNC EXEC END

%%
startPoint: EXEC LESSTHAN statementList GREATERTHAN END { printf("Compiled Succesfully\n");}
statementList: statements
	| statementList statements
	;
statements:NL
	| while_statement
	| statement
	| if_statement
	| init_var
	| input_statement
	| output_statement
	| init_const
	| predicate_def
	| array_init
	;
while_statement: WHILE LP expression_bool RP LB statementList RB
	| WHILE LP expression_bool RP body LB statementList RB;
expression_bool: term comparator term
| term
;
term: LP expression_bool RP 
	| TRUE
	| FALSE
	| ID
	| input_statement
	| predicate_call
	| array_find_val
	| NOT ID
	;
comparator: IFANDONLYIF | OR | IMPLIES | NOTEQUAL | EQUALITY | AND | XOR  | NAND | NOR;
statement: ID ASSIGN expression_bool SEMICOLON;
input_statement: SCANNER LP RP;
if_statement:IF LP expression_bool RP LB statementList RB COLON ELSE LB statementList RB
	| IF LP expression_bool RP LB statementList RB COLON body ELSE LB statementList RB
	| IF LP expression_bool RP LB statementList RB COLON ELSE body LB statementList RB
	| IF LP expression_bool RP LB statementList RB COLON body ELSE body LB statementList RB
	| IF LP expression_bool RP LB statementList RB
	| IF LP expression_bool RP body LB statementList RB
	;
body: NL
	| body NL
init_var: BOOL ID ASSIGN expression_bool SEMICOLON
	| BOOL ID SEMICOLON
	;
array_init: BOOL DOLLAR ID LSQB INT RSQB ASSIGN LB bools RB SEMICOLON
bools: 
	| bools expression_bool COMMA 
	;
output_statement: PRINTOF LP expression_bool RP SEMICOLON
	;
init_const: CONSTANT BOOL ID ASSIGN expression_bool SEMICOLON
	| CONSTANT BOOL STRING ASSIGN expression_bool SEMICOLON
	;
predicate_def: FNC BOOL ID LP bools RP LB predicate_body RB
	| FNC BOOL ID LP bools RP body LB predicate_body RB;
predicate_body: statementList RETURN expression_bool SEMICOLON
	|statementList RETURN expression_bool SEMICOLON body;
predicate_call: ID LP bools RP;
array_find_val: DOLLAR ID LSQB INT RSQB;
%%
#include "lex.yy.c"
int lineno;

main(){
  return yyparse();
}

yyerror( char *s ) { fprintf( stderr, " line %d has error", lineno, s); };
