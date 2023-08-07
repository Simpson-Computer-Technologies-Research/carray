all: output execute

output:
	gcc -o ./build/main ./src/main.c

execute:
	./build/main