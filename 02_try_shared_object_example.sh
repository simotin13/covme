#!/usr/bin/sh

echo "Copy examples/c/with_sharedobject/libcalc.so to /usr/local/lib,"
echo "and do ldconfig, so you need sudo option."
sudo cp examples/c/with_sharedobject/libcalc.so /usr/local/lib
sudo ldconfig

echo "execute ./covme examples/c/with_sharedobject/a.out"
echo "covme use gdb for trace program, gdb must be installed"
TEST_GDB=`which gdb`
if [ $? -ne 0 ]; then
  echo "gdb not found, please make sure gdb installed"
  exit 1
fi

./covme ./examples/c/function_call/a.out 5 5