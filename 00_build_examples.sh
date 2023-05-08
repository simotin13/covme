#!/usr/bin/sh
echo "build examples"
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
echo "build examples/c/function_call/a.out"
gcc -g -gdwarf-4 main.c calc.c
cd ..

cd with_stdin
echo "build examples/c/with_stdin/a.out"
gcc -g -gdwarf-4 main.c
cd ..

cd exit_target
echo "build examples/c/exit_target/a.out"
gcc -c -gdwarf-4 wait.c
ar rcs mylib.a wait.o
gcc -g main.c mylib.a
cd ..

cd with_sharedobject
# build shared object
echo "build examples/c/with_sharedobject/libcalc.so"
gcc -g -gdwarf-4 -shared calc.c -o libcalc.so

# build target program
echo "build examples/c/with_sharedobject/a.out"
gcc main.c -g -gdwarf-4 -L. -lcalc

cd ../..
cd cpp
cd function_call
echo "build examples/cpp/function_call/a.out"
g++ -g -gdwarf-4 main.cpp calc.cpp
cd ../../..
