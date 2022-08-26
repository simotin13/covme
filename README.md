[日本語のREADMEはこちら](https://github.com/simotin13/covme/blob/main/README-ja.md)

# What is this ?
`covme` is a code coverage tool for C/C++ application.

version 0.1.0 (2022/3/15), It's able to measure C1 coverage.

![covme demo](https://user-images.githubusercontent.com/3637006/159233398-08e44417-5225-4f3a-bd2f-6fbdea58ed83.gif)

# Supported platform
version 0.1.0 (2022/3/15), X86_64 GNU/Linux is supported.

Tested on
- Ubuntu20.04 LTS
- Ubuntu20.04(WSL2)

# Tools and library dependency
`covme` use `gdb` for code trace, so `gdb` must be installed.
And target program must contains DWARF format debug infomation.

# How to use
Download this repository.

In the downloded directory, there is a file named `covme`, it's an executable module.

you can run `covme` as follows,
specify your target program path as argument that you want to measure coverage.
```
./covme ./a.out
```

If target program takes command line args, specify them after module path.
```
./covme ./a.out 1 2
```

If the target program finished, `covme` generate HTML a coverage result report in `report` directory.

Note: Each time run `covme`, file in `report` directory is overwritten, please carefully

# Build target modules
`covme` use DWARF format for get code coverage, so please, make sure of target program contains debug infomation.

build command example).
```
gcc -g main.c
```

And once you build your source code, dont' move your source code another directory.
Because `covme` found your source code path from your target modules. If you want to move your source code of target modules, you need to rebuild program before execute `covme`.

# Examples and sample scripts
This repository contains target program code exsamples and sample scripts to help your understanding about `covme` behavior.

## examples
There are some sample target program source files in the `examples` directory.

1. function_call
   
   call function implemented in another file(calc.c), from main function(main.c).

1. with_sharedobject

   same as function_call,but build calc.c as shared object file(.so).

1. with_stdin

   sample for user input from stdin(scanf).

1. exit_target

   sample for code has infinite loop and long periods of no response from library functions.

## Build examples and try them

### Build examples
run `00_build_examples.sh`, it will build source files in examples directroy.
Note: `00_build_examples.sh` assumed that `gcc` is installed.

### run sample scripts and measure coverage
`01_try_simple_example.sh` ～ `03_try_stdin_example.sh` are sample sript of `covme`,try them after run `00_build_examples.sh` completed.

each sample script detail are following

1. 01_try_simple_example.sh
    
    Measure `examples/c/function_call` program coverage with `covme`.

1. 02_try_shared_object_example.sh

    Sample for program with shared object file.

    `02_try_shared_object_example.sh` uses `sudo` option to copy shared library file to `/usr/local/lib` and to run `ldconfig`.

1. 03_try_stdin_example.sh

   Sample for user input from stdin(scanf).

   You need to input from stdin while running `covme`.

1. 04_try_simple_cpp_example.sh

   Measure `examples/cpp/function_call` program coverage with `covme`.
   It's simple C++ application code coverage example.

1. 05_try_exit_trace_example.sh

   Measure `examples/c/exit_target` program coverage with `covme`.
   This is an example of coverage measurement when there is an infinite loop in the program and the library function does not return a response for a long time.
   You can stop trace and generate a coverage report by input `ctrl-c`.

# Known Bugs and Issues
Known Bugs and Issues are listed below
- some multi thread application will fail to measure correctly.
- some application that require I/O input(like network program) will fail to measure correctly. 
- C++ applications are not tested sufficiently.

# Roadmap
functions `covme` will support are listed below

- Fix Known bugs
- support multi thread program coverage
- C2 code coverage
- generate rich report
- detect memory leak of target program
- support ARM achitecture(ARMv7,AArch64)
- support embedded CPU achitecture(RX,RL78...etc)
- trace without gdb
- support PDB format

# About source code
I'm developing `covme` with golang, currently my source code is not clean and readble.
I will open my code when it has been a readble and graceful.

# About oss dependencies
see [oss.md](https://github.com/simotin13/covme/blob/main/oss.md) 
# Contributing
Bugs reports, feature requests are welcome. Please submit by Github Issues.
In some cace, I can't respond your Issue, sorry about that in advance.
For debugging `covme`, I might ask you submit your source code, modules, please cooperate if possible.

