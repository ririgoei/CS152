grammar Expr;

// ***Lexing rules***

INT     : [0-9]+ ;
NEWLINE : '\r'? '\n' ;
WS      : [ \t]+ -> skip ; // ignore whitespace
ID		: [a-zA-Z_]* ;

MUL 	: '*' ;
DIV 	: '/' ;
ADD 	: '+' ;
SUB 	: '-' ;
EQUAL	: '=';


// ***Parsing rules ***

/** The start rule */
prog: stat+ ;

stat: expr NEWLINE              # printExpr
    | NEWLINE                   # blank
    ;

expr: expr op=( '*' | '/' ) expr   # MulDiv
    | expr op=( '+' | '-' ) expr   # AddSub
	  | ID op='=' expr			# Assign
    | INT                       # int
	  | ID						# id
    | '(' expr ')'              # parens
    ;
