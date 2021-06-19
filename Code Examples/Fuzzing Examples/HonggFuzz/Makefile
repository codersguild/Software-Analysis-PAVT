CC=hfuzz-clang
CXX=hfuzz-clang++
FUZZER=honggfuzz

# list of C files
SRC=$(wildcard *.c)

all: fuzz

compile: *.c
	@mkdir -p bin/
	${CC} ${SRC} -o bin/code.out

generate_tests: compile
	@mkdir -p tests/
	dd if=/dev/random of=tests/input01.txt bs=32 count=1
	dd if=/dev/random of=tests/input02.txt bs=32 count=1
	dd if=/dev/random of=tests/input03.txt bs=32 count=1
	head -c 32 /dev/zero > tests/input04.txt
	dd if=/dev/random of=tests/input05.txt bs=32 count=1
	head -c 32 /dev/zero > tests/input06.txt

fuzz: generate_tests
	@mkdir -p output/
	${FUZZER} -i tests -o output -n 1 --exit_upon_crash --mutations_per_run 200 -P -- bin/code.out

clean: 
	rm -rf *.TXT *.fuzz tests/ bin/ output/