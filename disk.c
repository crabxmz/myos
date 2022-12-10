#include "disk.h"
#include "x86.h"
void waitdisk(void)
{
    // Wait for disk ready.
    while ((inb(0x1F7) & 0xC0) != 0x40)
        ;
}

void read_one_sector(uint8_t *buf, uint32_t offset)
{
    waitdisk();
    // 0x1f0 ~ 0x1f7 : primary buss
    outb(0x1F6, 0xE0 | ((offset >> 24) & 0x0F)); // 0xe0 master
    outb(0x1F2, 0x1);                            // sector count=1
    outb(0x1F3, offset & 0x000000ff);
    outb(0x1F4, (offset & 0x0000ff00) >> 8);
    outb(0x1F5, (offset & 0x00ff0000) >> 16);
    outb(0x1F7, 0x20); //"READ SECTORS" command
    waitdisk();

    /*
    will read 2 bytes from disk at once, see
    https://wiki.osdev.org/ATA_PIO_Mode#28_bit_PIO
    */

    uint32_t i = SECTOR_SIZE / 2;
    while (i--)
    {
        uint16_t data = inw(0x1F0);

        *buf = (data & 0x00ff);
        buf++;
        *buf = (data & 0xff00) >> 8;
        buf++;
    }
}