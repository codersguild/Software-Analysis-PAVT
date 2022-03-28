## Running `gcov`

We pass flags to `gcc` or `g++` as shown below for the file we want to test coverage on. 

```bash 
$ g++ -fprofile-arcs -ftest-coverage code.cpp
```

```bash
# Instrument code.c with gcov calls.
g++ -c -I./include -ftest-coverage -fprofile-arcs -Wall -O0 coverage/$1.c -o bin/$1.o
g++ -c -I./include -ftest-coverage -fprofile-arcs -Wall -O0 linklibs/link_$1.c -o bin/link_$1.o

# Don't instrument main with gcov.
g++ -Wall -O0 bin/$1.o bin/link_$1.o -o bin/main_$1.out -lgcov 

cat program_inputs/mod_inputs_$1.txt | sort | uniq -u > program_inputs/uniq_$1.txt
while IFS= read -r line; do
	./bin/main_$1.out $line
done < "program_inputs/uniq_$1.txt"

# Gcov for code
gcov -b -c bin/$1 >> coverage.log
gcov -b -c bin/link_$1 >> coverage.log

## Python Processing Script
for index, x in enumerate(lines):
	if "linklibs" in x:
		program = int(x.split("_")[1].split(".")[0])
		print(program)
		if program in correct:
			count1 += 1
			score1 += float(lines[index+1].split(' ')[1].split(':')[1].strip()[:-1])
			if "Taken" in lines[index+3]:
				count4 += 1
				score4 += float(lines[index+3].split(' ')[3].split(':')[1].strip()[:-1])
				print(lines[index+3])
			else:
				count4 += 1
				score4 += 100.0
			print(f"{x}, {float(lines[index+1].split(' ')[1].split(':')[1].strip()[:-1])}")
	if "coverage" in x:
		count2 += 1
		score2 += float(lines[index+1].split(' ')[1].split(':')[1].strip()[:-1])
		score3 += float(lines[index+2].split(' ')[1].split(':')[1].strip()[:-1])
		print(f"{x}, {float(lines[index+1].split(' ')[1].split(':')[1].strip()[:-1])}")

print(score1 / (100 * count1))
# print(score2 / (100 * count2))
# print(score3 / (100 * count2))
print(score4 / (100 * count1))
```
## Running `gtest`
 
Clone the repository [googletest](https://github.com/google/googletest). Use [cmake] to generate `build` & `makefiles`. 

```bash 
$ cmake .
$ make -j4
$ sudo make install 
```

Running tests, see `code.cpp` file.

```bash 
$ g++ code.cpp -lgtest -lgtest_main -pthread
```
