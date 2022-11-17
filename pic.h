#ifndef PIC_H
#define PIC_H
#include "type.h"
#include "x86.h"

// master and slave pic addr are specified by hardwre?
#define PIC1 0x20 /* IO base address for master PIC */
#define PIC2 0xA0 /* IO base address for slave PIC */
#define PIC1_COMMAND PIC1
#define PIC1_DATA (PIC1 + 1)
#define PIC2_COMMAND PIC2
#define PIC2_DATA (PIC2 + 1)

// 8259 pic cmd
#define ICW1_ICW4 0x01      /* ICW4 (not) needed */
#define ICW1_SINGLE 0x02    /* Single (cascade) mode */
#define ICW1_INTERVAL4 0x04 /* Call address interval 4 (8) */
#define ICW1_LEVEL 0x08     /* Level triggered (edge) mode */
#define ICW1_INIT 0x10      /* Initialization - required! */

#define ICW4_8086 0x01       /* 8086/88 (MCS-80/85) mode */
#define ICW4_AUTO 0x02       /* Auto (normal) EOI */
#define ICW4_BUF_SLAVE 0x08  /* Buffered mode/slave */
#define ICW4_BUF_MASTER 0x0C /* Buffered mode/master */
#define ICW4_SFNM 0x10       /* Special fully nested (not) */

#define PIC_EOI 0x20 /* End-of-interrupt command code */

// irq base
#define IRQ_NO_BASE (0x20)

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

void print_pic_masks()
{
    // 0 1 2 .. 15
    uint8_t i = 0;
    for (; i < 16; i++)
    {
        if (irq_get_mask(i))
        {
            putchar('1');
        }
        else
        {
            putchar('0');
        }
    }
}

void pic_remap(int offset1, int offset2)
{
    /*
        Its vector offset. (ICW2)
        Tell it how it is wired to master/slaves. (ICW3)
        Gives additional information about the environment. (ICW4)
    */
    uint8_t a1, a2;
    // save masks
    a1 = inb(PIC1_DATA);io_wait();
    a2 = inb(PIC2_DATA);io_wait();

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

#endif