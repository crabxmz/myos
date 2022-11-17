#ifndef PAGING_H
#define PAGING_H
#include "log.h"

void is_pae_enabled()
{ // page address extension
    int infotype, a, b, c, d;
    for (infotype = 0; infotype < 5; infotype++)
    {
        __asm__("cpuid"
                : "=a"(a), "=b"(b), "=c"(c), "=d"(d) // The output variables. EAX -> a and vice versa.
                : "0"(infotype));                    // Put the infotype into EAX.
    }
    //   printint(infotype);println("");
    //   printint(a);println("");
    //   printint(b);println("");
    //   printint(c);println("");
    //   printint(d);println("");
    // https://en.wikipedia.org/wiki/CPUID#Inline_assembly
    if (((unsigned)d) & (0x1 << 6))
    {
        println("PAE enabled");
    }
    else
    {
        println("PAE disabled");
    }
}

void printcr0()
{
    uint32_t cr0;
    __asm__("mov %cr0, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr0));
    printuint32(cr0);
    println(" cr0");
}
void printcr1()
{
    uint32_t cr1;
    __asm__("mov %cr1, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr1));
    printuint32(cr1);
    println(" cr1");
}
void printcr2()
{
    uint32_t cr2;
    __asm__("mov %cr2, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr2));
    printuint32(cr2);
    println(" cr2");
}
void printcr3()
{
    uint32_t cr3;
    __asm__("mov %cr3, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr3));
    printuint32(cr3);
    println(" cr3");
}
void printcr4()
{
    uint32_t cr4;
    __asm__("mov %cr4, %ebx");
    __asm__("mov %%ebx, %0"
            : "=g"(cr4));
    printuint32(cr4);
    println(" cr4");
}

void printeax(){
    uint32_t eax;
    __asm__("mov %%eax, %0"
            : "=g"(eax));
    printuint32(eax);
    println(" eax");
}

void inline enable_paging()
{
    // page size extention, page size 4k->4M

    // the PG “paging-enable” bit

    // __asm__("mov %cr0, %eax");
    // __asm__("or $0x80000001, %eax");
    // __asm__("mov %eax, %cr0");

    __asm__("mov %cr4, %ebx");
    __asm__("or $0x00000010, %ebx");
    __asm__("mov %ebx, %cr4");
}
#endif