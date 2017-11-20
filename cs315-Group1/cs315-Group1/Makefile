cs315f08_group1: y.tab.c lex.yy.c
	gcc -o cs315f08_group1 y.tab.c
	./cs315f08_group1 < cs315f08_group1.test
	rm -f y.tab.c lex.yy.c cs315f08_group1
y.tab.c: cs315f08_group1.y lex.yy.c
	yacc cs315f08_group1.y
lex.yy.c: cs315f08_group1.l
	lex cs315f08_group1.l