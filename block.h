#ifndef BLOCK_H
#define BLOCK_H

#include "type.h"
#include "disk.h"

#define BLOCK_SIZE 1024
#define BLOCK_ID_2_LBA(i) (i * BLOCK_SIZE)
uint32_t read_blk(uint8_t *buf, uint32_t blk_id);
uint32_t write_blk(uint8_t *buf, uint32_t blk_id);

#endif