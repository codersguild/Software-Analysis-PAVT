## Running `gcov`

We pass flags to `gcc` or `g++` as shown below for the file we want to test coverage on. 

```bash 
$ g++ -fprofile-arcs -ftest-coverage code.cpp
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
