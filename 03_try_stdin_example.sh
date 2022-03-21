#!/usr/bin/sh

echo "execute ./covme ./examples/c/with_stdin/a.out"
echo "covme use gdb for trace program, gdb must be installed"
TEST_GDB=`which gdb`
if [ $? -ne 0 ]; then
  echo "gdb not found, please make sure gdb installed"
  exit 1
fi

./covme ./examples/c/with_stdin/a.out