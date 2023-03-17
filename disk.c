#include "disk.h"
#include "x86.h"
uint32_t waitdisk(void)
{
    // Wait for disk ready.
    while ((inb(IDE_STATUS_REG_R) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY)
        ;
    return 0;
}

// 28 bit LBA, PIO mode
uint32_t read_one_sector(uint8_t *buf, uint32_t lba)
{
    waitdisk();
    // 0x1f0 ~ 0x1f7 : primary buss
    outb(IDE_DRV_REG, IDE_MASTER_DEV | ((lba >> 24) & 0x0F)); // 0xe0 master, and highest 4 bits of the LBA
    outb(IDE_SEC_CNT_REG, 0x1);                               // sector count=1
    outb(IDE_LBA_LOW_REG, lba & 0x000000ff);
    outb(IDE_LBA_MID_REG, (lba & 0x0000ff00) >> 8);
    outb(IDE_LBA_HIGH_REG, (lba & 0x00ff0000) >> 16);
    outb(IDE_CMD_REG_W, IDE_CMD_READ); //"READ SECTORS" command
    waitdisk();

    /*
    will read 2 bytes from disk at once, see
    https://wiki.osdev.org/ATA_PIO_Mode#28_bit_PIO
    */

    uint32_t i = SECTOR_SIZE / 2;
    while (i--)
    {
        uint16_t data = inw(IDE_DATA_REG);
        *(uint16_t *)buf = data;
        buf += sizeof(data);
    }
    return 0;
}

uint32_t write_one_sector(uint8_t *buf, uint32_t lba)
{
    waitdisk();
    // 0x1f0 ~ 0x1f7 : primary buss
    outb(IDE_DRV_REG, IDE_MASTER_DEV | ((lba >> 24) & 0x0F)); // 0xe0 master, and highest 4 bits of the LBA
    outb(IDE_SEC_CNT_REG, 0x1);                               // sector count=1
    outb(IDE_LBA_LOW_REG, lba & 0x000000ff);
    outb(IDE_LBA_MID_REG, (lba & 0x0000ff00) >> 8);
    outb(IDE_LBA_HIGH_REG, (lba & 0x00ff0000) >> 16);
    outb(IDE_CMD_REG_W, IDE_CMD_WRITE); // WRITE SECTORS" command
    waitdisk();

    uint32_t i = SECTOR_SIZE / 2;
    while (i--)
    {
        uint16_t data = *(uint16_t *)buf;
        outw(IDE_DATA_REG, data);
        buf += sizeof(data);
    }
    return 0;
}