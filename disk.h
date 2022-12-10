#ifndef DISK_H
#define DISK_H

#include "type.h"
#define SECTOR_SIZE 512

void waitdisk(void);

void read_one_sector(uint8_t *buf, uint32_t offset);

#endif