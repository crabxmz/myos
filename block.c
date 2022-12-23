#include "block.h"
#include "log.h"
uint32_t read_blk(uint8_t *buf, uint32_t blk_id)
{
    uint32_t i = 0;
    for (i = 0; i < BLOCK_SIZE / SECTOR_SIZE; i++)
    {
        // print_str_and_uint32("read lba",BLOCK_ID_2_LBA(blk_id) + i * SECTOR_SIZE);
        read_one_sector(&buf[i * SECTOR_SIZE], BLKID_TO_SECID(blk_id) + i);
    }
}
uint32_t write_blk(uint8_t *buf, uint32_t blk_id)
{
    uint32_t i = 0;
    for (i = 0; i < BLOCK_SIZE / SECTOR_SIZE; i++)
    {
        write_one_sector(&buf[i * SECTOR_SIZE], BLKID_TO_SECID(blk_id) + i);
    }
}