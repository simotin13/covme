#!/usr/bin/sh
echo "build examples C,C++ code"
TEST_GCC=`which gcc`
if [ $? -ne 0 ]; then
  echo "gcc not found, please make sure gcc installed"
  exit 1
fi

TEST_GPP=`which g++`
if [ $? -ne 0 ]; then
  echo "g++ not found, please make sure g++ installed"
  exit 1
fi

cd examples
cd c
cd function_call
echo "build c/function_call/a.out"
gcc -g main.c calc.c
cd ..

cd with_stdin
echo "build c/with_stdin/a.out"
gcc -g main.c
cd ..

cd with_sharedobject
# build shared object
echo "build c/with_sharedobject/libcalc.so"
gcc -g -shared calc.c -o libcalc.so

# build target program
echo "build c/with_sharedobject/a.out"
gcc main.c -g -L. -lcalc

cd ../..
cd cpp
cd function_call
echo "build cpp/function_call/a.out"
g++ -g main.cpp calc.cpp
cd ../../..
