#include "type.h"
#include "x86.h"
#include "log.h"
#include "idt.h"
#include "paging.h"

int main()
{
    println("kernel started..");
    init_interrupt();
    // init_ps2();   // why it is no use ?
    // print_pic_masks();
    // println(" print_pic_masks");

    /*
    test for idt
     store_idt();
    */
    /*
    test for keyboard interrupt
        __asm__("int $33");
    */

    // test for isr0
    //  int a = 1;
    //  int b = 0;
    //  int c = a / b;
    enable_paging();
    println("exit kernel");
    printcr0();
    // printcr1();
    // printcr2();
    printcr3();
    printcr4();
    printeax();
    return 0;
}