#include "pic.h"
#include "x86.h"

void pic_send_eoi(uint8_t irq)
{
    if (irq >= 8)
        outb(PIC2_COMMAND, PIC_EOI);

    outb(PIC1_COMMAND, PIC_EOI);
}

/*
arguments:
    offset1 - vector offset for master PIC
        vectors on the master become offset1..offset1+7
    offset2 - same for slave PIC: offset2..offset2+7
*/

void outb_and_wait(uint16_t port, uint8_t data)
{
    outb(port, data);
    io_wait();
}

void irq_set_mask(unsigned char IRQline)
{
    uint16_t port;
    uint8_t value;

    if (IRQline < 8)
    {
        port = PIC1_DATA;
    }
    else
    {
        port = PIC2_DATA;
        IRQline -= 8;
    }
    value = inb(port) | (1 << IRQline);
    outb(port, value);
}

void irq_clear_mask(uint8_t IRQline)
{
    uint16_t port;
    uint8_t value;

    if (IRQline < 8)
    {
        port = PIC1_DATA;
    }
    else
    {
        port = PIC2_DATA;
        IRQline -= 8;
    }
    value = inb(port) & ~(1 << IRQline);
    outb(port, value);
}

uint8_t irq_get_mask(uint8_t IRQline)
{
    uint16_t port;

    if (IRQline < 8)
    {
        port = PIC1_DATA;
    }
    else
    {
        port = PIC2_DATA;
        IRQline -= 8;
    }
    return inb(port) & (1 << IRQline);
}

void pic_remap(uint32_t offset1, uint32_t offset2)
{
    /*
        Its vector offset. (ICW2)
        Tell it how it is wired to master/slaves. (ICW3)
        Gives additional information about the environment. (ICW4)
    */
    uint8_t a1, a2;
    // save masks
    a1 = inb(PIC1_DATA);
    io_wait();
    a2 = inb(PIC2_DATA);
    io_wait();

    //
    // outb_and_wait(PIC1_DATA, 0xff);
    // outb_and_wait(PIC2_DATA, 0xff);

    // starts initialization sequence(in cascade mode)
    outb_and_wait(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4);
    outb_and_wait(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);
    // ICW2: set pic irq offset of master and slave
    outb_and_wait(PIC1_DATA, offset1);
    outb_and_wait(PIC2_DATA, offset2);
    // ICW3: tell Master PIC that there is a slave PIC at IRQ2 (0000 0100)
    outb_and_wait(PIC1_DATA, 4);
    // ICW3: tell Slave PIC its cascade identity (0000 0010)
    outb_and_wait(PIC2_DATA, 2);

    // into 8086 mode
    outb_and_wait(PIC1_DATA, ICW4_8086);
    outb_and_wait(PIC2_DATA, ICW4_8086);

    // restore saved masks.
    outb_and_wait(PIC1_DATA, a1);
    outb_and_wait(PIC2_DATA, a2);
}

void inline enable_interrupt()
{
    __asm__ volatile("sti"); // enable interrupt?
}

void inline disable_interrupt()
{
    __asm__ volatile("cli"); // enable interrupt?
}