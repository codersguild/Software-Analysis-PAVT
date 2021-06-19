#!/usr/bin/bash
CC=/usr/bin/afl-clang-fast 
CXX=/usr/bin/afl-clang-fast++

testDir="tests"
outputDir="output"
buildDir="build"

mkdir -p $testDir 
mkdir -p $outputDir
mkdir -p $buildDir

dd if=/dev/random of=$testDir/input02.txt bs=32 count=1
dd if=/dev/random of=$testDir/input03.txt bs=32 count=1
head -c 32 /dev/zero > $testDir/input04.txt
dd if=/dev/random of=$testDir/input05.txt bs=32 count=1
head -c 32 /dev/zero > $testDir/input06.txt

${CXX} code.cpp -o "$buildDir"/code

## Running AFL in parallel in background.
## 8GB Memory for fuzzing
for i in $(seq 2 $(nproc));
do
    echo "Spawning new para-fuzzer now : fuzzer_0$i"
    sleep 1
    afl-fuzz -S fuzzer_0"$i" -i "$testDir/" -o "$outputDir/" -m 8G "$buildDir"/$1 >/dev/null 2>&1 &
done

## This is to be done last else
## it hangs up and can't proceed.
## Also show atleast progess of Master.
afl-fuzz -M master_fuzz -i "$testDir/" -o "$outputDir/" -m 8G "$buildDir"/$1