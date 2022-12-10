#include "panic.h"
#include "log.h"
void inline panic(const char *msg)
{
    print("panic: ");
    println(msg);
    while (1)
        ;
}