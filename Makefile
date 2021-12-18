

json: json.l json.y
	flex json.l
	bison -d json.y
	gcc json.lex.c json.tab.c -o json

clean: json.lex.c json.tab.c json
	rm json.lex.c json.tab.c json