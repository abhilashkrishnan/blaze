FILES = ./build/memory/memory.o ./build/vm/value.o ./build/vm/object.o ./build/vm/chunk.o ./build/debug.o ./build/scanner/scanner.o ./build/compiler/compiler.o ./build/vm/vm.o
INCLUDES = -I./src
FLAGS = -g -Wall

all: ./build/memory/memory.o ./build/vm/chunk.o ./build/vm/value.o ./build/vm/object.o ./build/debug.o ./build/scanner/scanner.o ./build/compiler/compiler.o ./build/vm/vm.o ./bin/blaze

./bin/blaze: ./src/main.c
	gcc ${INCLUDES} ${FLAGS} ${FILES} ./src/main.c -o ./bin/blaze

./build/memory/memory.o: ./src/memory/memory.c
	gcc ${INCLUDES} ${FLAGS} ./src/memory/memory.c -o ./build/memory/memory.o -c

./build/vm/chunk.o: ./src/vm/chunk.c
	gcc ${INCLUDES} ${FLAGS} -I./src/memory ./src/vm/chunk.c -o ./build/vm/chunk.o -c

./build/debug.o: ./src/debug.c
	gcc ${INCLUDES} ${FLAGS} -I./src/vm ./src/debug.c -o ./build/debug.o -c

./build/vm/value.o: ./src/vm/value.c
	gcc ${INCLUDES} ${FLAGS} -I./src/memory ./src/vm/value.c -o ./build/vm/value.o -c

./build/vm/object.o: ./src/vm/object.c
	gcc ${INCLUDES} ${FLAGS} -I./src/memory ./src/vm/object.c -o ./build/vm/object.o -c

./build/scanner/scanner.o: ./src/scanner/scanner.c
	gcc ${INCLUDES} ${FLAGS} -I./src/vm ./src/scanner/scanner.c -o ./build/scanner/scanner.o -c

./build/compiler/compiler.o: ./src/compiler/compiler.c
	gcc ${INCLUDES} ${FLAGS} -I./src/vm ./src/compiler/compiler.c -o ./build/compiler/compiler.o -c

./build/vm/vm.o: ./src/vm/vm.c
	gcc ${INCLUDES} ${FLAGS} -I./src/vm ./src/vm/vm.c -o ./build/vm/vm.o -c

clean:
	rm -rf ${FILES}
	rm -rf ./bin/blaze