SPACE [ \t\n]+
ASSIGN \=>
NL \n
FNC fnc
CONSTANT const
PRINTOF printOf
TRUE True
FALSE False
OR or
AND and
XOR xor
NAND nand
NOR nor
IFANDONLYIF ifaoif
IMPLICATION imp
IF if
ELSEIF elif
ELSE else
COMMA \,
DOT \.
COLON \:
SEMICOLON \;
LT \<
GT \>
EQUALITY \?\?
EQUAL \?
NOTEQUAL \!\?
NOT \!
LP \(
RP \)
LB \{
RB \}
DOLLAR \$
LSQB \[
RSQB \]
PLUS \+
MINUS -
MUL \*
DIV \/
POW \^
BOOL bool
SCANNER scanOf
ID ([a-z]({LETTER}|{DIGIT})*)
INT ([+-]?[0-9]+)
DIGIT [0-9]
LETTER [a-zA-Z]
STRING \"([^\\\"]|\\\\|\\\"|\\n)*\"
%%
{TRUE} return TRUE;
FALSE return FALSE;
while   return WHILE;
return  return RETURN;
NL return NL;
{PRINTOF} return PRINTOF;
{SCANNER} return SCANNER;
{CONSTANT} return CONSTANT;
{DIGIT} return DIGIT;
{BOOL} return BOOL;
{IF} return IF;
{ELSEIF} return ELSEIF;
{ELSE} return ELSE;
{IFANDONLYIF} return IFANDONLYIF;
{IMPLICATION} return IMPLIES;
{AND}	return AND;
{OR}	return OR;
{ASSIGN} return ASSIGN;
{XOR}  return XOR;
{COLON} return COLON;
{SEMICOLON} return SEMICOLON;
{PLUS} return PLUS;
{MINUS} return MINUS;
{DIV} return DIVIDE;
{MUL} return MULTIPLY;
{DOT} return DOT;
{COMMA} return COMMA;
{EQUALITY} return EQUALITY;
{EQUAL} return EQUAL;
{NOTEQUAL} return NOTEQUAL;
{LT} return LESSTHAN;
{GT} return GREATERTHAN;
{POW} return POWER;
{NAND} return NAND;
{NOR} return NOR;
{LP} return LP;
{RP} return RP;
{LB} return LB;
{RB} return RB;
{INT} return INT;
{LSQB} return LSQB;
{RSQB} return RSQB;
{LETTER} return LETTER;
{ID} return ID;
{FNC} return FNC;
{DOLLAR} return DOLLAR;
{NOT} return NOT;
{STRING} return STRING;
%%
int yywrap()
{
        return 1;
}