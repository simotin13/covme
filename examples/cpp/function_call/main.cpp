#include <iostream>
#include "calc.h"

int main(int argc, char **argv)
{
    /*
    * With command line arg example, call function implemented in onother file(calc.c)
    * Comment lines are not count as executable lines.
    */
    int a, b;
    int result = 0;

    if (argc < 3) {
        // must input 2 number args
        std::cerr << "input 2 numbers for calc add" << std::endl;
        std::cerr << "Usage) ./a.out 1 2"  << std::endl;
        return -1;
    }

    Calc calc;
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    result = calc.add(1, 2);

    if (result == 3)
    {
        std::cout << "answer is 3" << std::endl;
    }
    else
    {
        std::cout << "answer " << result << " is not 3" << std::endl;
    }
    return 0;
}
