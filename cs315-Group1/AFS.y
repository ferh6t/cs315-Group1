/* AFS.y */

%{
#include <stdio.h>
%}

%token WHILE RETURN PRINTOF SCANNER CONSTANT DIGIT BOOL
%token IF ELSEIF ELSE IFANDONLYIF IMPLIES AND OR ASSIGN XOR  
%token COLON SEMICOLON PLUS MINUS DIVIDE MULTIPLY DOT COMMA EQUALITY EQUAL NOTEQUAL
%token LESSTHAN GREATERTHAN POWER NAND NOR LP RP LB RB LSQB RSQB LETTER
%token ID DOLLAR NOT NL
%token TRUE
%token FALSE
%token STRING INT FNC EXEC END

%%
program: EXEC statementList END
	;

statementList: statements
	| statementList statements
	;
statements:	while_statement
	| statement
	| if_statement
	| init_var
	| statements output_statement
	| statements init_const
	| statements predicate_def
	| statements array_init
	;
while_statement: WHILE LP expression_bool RP LB statements RB;
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
	;
comparator: IFANDONLYIF | OR | IMPLIES | NOTEQUAL | EQUALITY | AND | XOR  | NAND | NOR;
statement: ID ASSIGN expression_bool  SEMICOLON {printf("here"); };
input_statement: SCANNER LP RP;
if_statement: IF LP expression_bool RP LB statements RB
	| IF LP expression_bool RP LB statements RB ELSE LB statements RB
	;
init_var: BOOL ID ASSIGN expression_bool SEMICOLON
	| BOOL ID SEMICOLON
	;
array_init: BOOL DOLLAR ID LSQB INT RSQB ASSIGN LB bools RB SEMICOLON
bools: 
	| bools expression_bool COMMA 
	;
output_statement: PRINTOF LP expression_bool RP SEMICOLON;
init_const: CONSTANT BOOL ID ASSIGN expression_bool SEMICOLON
	| CONSTANT BOOL STRING ASSIGN expression_bool SEMICOLON
	;
predicate_def: FNC BOOL ID LP bools RP LB predicate_body RB;
predicate_body: statements RETURN expression_bool SEMICOLON	;
predicate_call: ID LP bools RP SEMICOLON;
array_find_val: ID LSQB INT RSQB;
%%
#include "lex.yy.c"
int lineno;

main(){
  return yyparse();
}

yyerror( char *s ) { fprintf( stderr, " in line %d %s\n", lineno, s); };