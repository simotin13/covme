#!/usr/bin/sh

echo "execute ./covme ./examples/c/exit_target/a.out"
echo "covme use gdb for trace program, gdb must be installed"
TEST_GDB=`which gdb`
if [ $? -ne 0 ]; then
  echo "gdb not found, please make sure gdb installed"
  exit 1
fi
echo ""
echo "This example shows how to stop trace target."
echo "Target program has wait loop which covme can't handle."
echo "If you want to stop trace target, input ctrl-c."
echo "After target is stopped, coverage report will be generated."
echo ""
./covme ./examples/c/exit_target/a.out 
