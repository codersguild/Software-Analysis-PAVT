# AFL Running script. 
# Export AFL base directory and setup AFL First.
# https://afl-1.readthedocs.io/en/latest/quick_start.html

$AFL_DIR/afl-gcc -g -O0 -o buggy buggy.c

mkdir -p input output
dd if=/dev/random of=input/input01.txt bs=32 count=1
dd if=/dev/random of=input/input02.txt bs=32 count=1
dd if=/dev/random of=input/input03.txt bs=32 count=1
head -c 32 /dev/zero > input/input04.txt
dd if=/dev/random of=input/input05.txt bs=32 count=1
head -c 32 /dev/zero > input/input06.txt

# sudo chmod 777 input/* output/*/*

$AFL_DIR/afl-fuzz -i input -o output -- ./buggy
rm -rf input/* *.out

# sudo chmod 777 * input/* output/*/*
