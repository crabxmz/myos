#include "ext2.h"
#include "log.h"
void print_ext2_group_desc(ext2_group_desc *gd)
{
    // printf("======%s======\n", __FUNCTION__);
    printNumberVar(gd->bg_block_bitmap);
    printNumberVar(gd->bg_inode_bitmap);
    printNumberVar(gd->bg_inode_table);
    printNumberVar(gd->bg_free_blocks_count);
    printNumberVar(gd->bg_free_inodes_count);
    printNumberVar(gd->bg_used_dirs_count);
    printNumberVar(gd->bg_pad);
}

void print_ext2_super_block(ext2_super_block *sb)
{
    // printf("======%s======\n", __FUNCTION__);
    printNumberVar(sizeof(ext2_inode));
    printNumberVar(sizeof(ext2_dir_entry));
    // uint32_t s_inodes_count;      /* Inodes count */
    // uint32_t s_blocks_count;      /* Blocks count */
    // uint32_t s_r_blocks_count;    /* Reserved blocks count */
    // uint32_t s_free_blocks_count; /* Free blocks count */
    // uint32_t s_free_inodes_count; /* Free inodes count */
    // uint32_t s_first_data_block;  /* First Data Block */
    // uint32_t s_log_block_size;    /* Block size */
    // uint32_t s_log_frag_size;     /* Fragment size */
    // uint32_t s_blocks_per_group;  /* # Blocks per group */
    // uint32_t s_frags_per_group;   /* # Fragments per group */
    // uint32_t s_inodes_per_group;  /* # Inodes per group */
    printNumberVar(sb->s_inodes_count);
    printNumberVar(sb->s_blocks_count);
    printNumberVar(sb->s_r_blocks_count);
    printNumberVar(sb->s_free_blocks_count);
    printNumberVar(sb->s_free_inodes_count);
    printNumberVar(sb->s_first_data_block);
    printNumberVar(sb->s_log_block_size);
    printNumberVar(sb->s_log_frag_size);
    printNumberVar(sb->s_frags_per_group);
    printNumberVar(sb->s_blocks_per_group);
    printNumberVar(sb->s_inodes_per_group);
    printNumberVar(sb->s_blocks_count / sb->s_blocks_per_group);
    printNumberVar(sb->s_inodes_count / sb->s_inodes_per_group);
    printNumberVar(sb->s_first_data_block);
    printNumberVar(sb->s_first_ino);
    if (sb->s_inode_size != sizeof(ext2_inode))
    {
        panic("sb->s_inode_size != sizeof(ext2_inode)");
    }
}

// void print_ext2_inode(ext2_inode *inode_table, ext2_inode *inode, int depth)
// {
//     // printf("======%s %d======\n", __FUNCTION__, depth);
//     if (S_ISDIR(inode->i_mode))
//     {
//         // printf("is a dir inode\n");
//         printNumberVar_t(inode->i_blocks);
//         printNumberVar_t(inode->i_size);
//         int j;

//         ext2_dir_entry *dir = (ext2_dir_entry *)&(buffer[inode->i_block[0] * EXT2_BLOCK_SIZE]);
//         uint32_t accumulated_len = 0;
//         for (j = 0; j < EXT2_N_BLOCKS && dir->rec_len && dir->name_len && accumulated_len < EXT2_BLOCK_SIZE; j++)
//         {
//             // printf("******************\n");
//             printstr(dir->name);
//             printNumberVar_t(dir->name_len);
//             printNumberVar_t(dir->rec_len);
//             printNumberVar_t(dir->inode);
//             accumulated_len += dir->rec_len;
//             dir = (ext2_dir_entry *)((uint8_t *)dir + dir->rec_len);

//             if (strlen(dir->name) && strcmp(dir->name, ".") && strcmp(dir->name, ".."))
//             {
//                 // printf("&&&&&&&&&&&&&&&& enter %s\n", dir->name);
//                 print_ext2_inode(inode_table, &inode_table[dir->inode - 1], depth + 1);
//             }
//         }
//     }
//     else if (S_ISREG(inode->i_mode))
//     {
//         // printf("is a file inode\n");
//         printNumberVar_t(inode->i_blocks);
//         printNumberVar_t(inode->i_size);
//         uint32_t j;
//         for (j = 0; j < EXT2_IND_BLOCK && j < inode->i_blocks && inode->i_block[j]; j++)
//         {
//             // printf("+++++++data block++++++\n");
//             printNumberVar_t(inode->i_block[j]);
//             printNumberVar_t(inode->i_size);
//             char *content = (char *)&(buffer[inode->i_block[j] * EXT2_BLOCK_SIZE]);
//             // printf("%s\n", content);
//         }
//     }
//     else
//     {
//         // printf("maybe a data block\n");
//     }
// }

uint32_t read_ext2_super_block(uint8_t *buf)
{
    return read_blk(buf, 0);
}
uint32_t read_ext2_group_desc(uint8_t *buf, ext2_super_block *sb, uint32_t group_id)
{
    uint32_t start_blk_id = sb->s_blocks_per_group * group_id + 1;
    return read_blk(buf, start_blk_id);
}
uint32_t read_ext2_inode_table(uint8_t *buf, ext2_super_block *sb, uint32_t group_id)
{
    int i;
    uint32_t table_offset = (uint32_t)(&(((ext2_group_desc *)0)->bg_inode_table));
    uint32_t start_blk_id = sb->s_blocks_per_group * group_id + 1 + table_offset / EXT2_BLOCK_SIZE;
    uint32_t table_size_in_blk = sb->s_inodes_per_group * sizeof(ext2_inode) / EXT2_BLOCK_SIZE;
    while (table_size_in_blk--)
    {
        read_blk(buf, start_blk_id);
        buf += EXT2_BLOCK_SIZE;
        start_blk_id++;
    }
    return 0;
}
uint32_t read_ext2_inode(uint8_t *buf, ext2_inode *inode_table, uint32_t inode_id)
{
    ext2_inode *inode = &inode_table[inode_id - 1];
    return 0;
}
uint32_t read_ext2_data_block(uint8_t *buf, uint32_t block_id) {
    return 0;
}
// void main()
// {
//     uint32_t tmp_off;
//     FILE *fp = fopen("test_disk", "rb");
//     if (fp == NULL)
//     {
//         perror("Error opening file");
//         return;
//     }
//     fseek(fp, BASE_OFFSET, SEEK_SET);
//     uint32_t result = fread(buffer + BASE_OFFSET, sizeof(char), fileSize - BASE_OFFSET, fp);
//     if (result != fileSize - BASE_OFFSET)
//     {
//         perror("Error reading file");
//         return;
//     }
//     fclose(fp);

//     ext2_super_block *sb = (ext2_super_block *)(buffer + BASE_OFFSET);
//     ext2_group_desc *gd = (ext2_group_desc *)((ext2_super_block *)(buffer + BASE_OFFSET) + 1);

//     ext2_inode *inode_table = (ext2_inode *)&buffer[gd->bg_inode_table * EXT2_BLOCK_SIZE];
//     // ext2_inode *inode_table = VAL_TO_POINTER(buffer[gd->bg_inode_table * EXT2_BLOCK_SIZE], ext2_inode);
//     uint8_t *block_bitmap = (uint8_t *)&buffer[gd->bg_block_bitmap * EXT2_BLOCK_SIZE];
//     // uint8_t *block_bitmap = VAL_TO_POINTER(buffer[gd->bg_block_bitmap * EXT2_BLOCK_SIZE], uint8_t);

//     print_ext2_super_block(sb);
//     print_ext2_group_desc(gd);
//     print_ext2_inode(inode_table, &inode_table[EXT2_ROOT_INODE - 1], 0);
// }
