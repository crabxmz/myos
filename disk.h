#ifndef DISK_H
#define DISK_H

#include "type.h"
#define SECTOR_SIZE 512

#define IDE_BSY 0x80
#define IDE_DRDY 0x40
#define IDE_DF 0x20
#define IDE_ERR 0x01

#define IDE_CMD_READ 0x20
#define IDE_CMD_WRITE 0x30
// #define IDE_CMD_RDMUL 0xc4
// #define IDE_CMD_WRMUL 0xc5

#define IDE_DATA_REG 0x1F0
#define IDE_ERR_REG_R 0x1F1
#define IDE_FEAT_REG_W 0x1F1
#define IDE_SEC_CNT_REG 0x1f2
#define IDE_LBA_LOW_REG 0x1F3
#define IDE_LBA_MID_REG 0x1F4
#define IDE_LBA_HIGH_REG 0x1F5

#define IDE_DRV_REG 0x1F6
#define IDE_STATUS_REG_R 0x1F7
#define IDE_CMD_REG_W 0x1F7
#define IDE_ALT_STATUS_REG_R 0x3F6
#define IDE_DEV_CTRL_REG_W 0x3F6

#define IDE_MASTER_DEV 0xE0
#define IDE_SLAVE_DEV 0xF0

// 1F0 (Read and Write): Data Register
// 1F1 (Read): Error Register
// 1F1 (Write): Features Register
// 1F2 (Read and Write): Sector Count Register
// 1F3 (Read and Write): LBA Low Register
// 1F4 (Read and Write): LBA Mid Register
// 1F5 (Read and Write): LBA High Register
// 1F6 (Read and Write): Drive/Head Register, an IDE usually has a master and a slave dirver
// 1F7 (Read): Status Register
// 1F7 (Write): Command Register
// 3F6 (Read): Alternate Status Register
// 3F6 (Write): Device Control Register

void waitdisk(void);

void read_one_sector(uint8_t *buf, uint32_t lab);
void write_one_sector(uint8_t *buf, uint32_t lab);

#endif