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

void print_ext2_inode(ext2_inode *inode)
{
    printStringVar(__FUNCTION__);
    printNumberVar(inode->i_blocks);
    printNumberVar(inode->i_size);
    if (S_ISDIR(inode->i_mode))
    {
        println("inode is a dir");

        int j;

        // ext2_dir_entry *dir = (ext2_dir_entry *)&(buffer[inode->i_block[0] * EXT2_BLOCK_SIZE]);
        // uint32_t accumulated_len = 0;
        // for (j = 0; j < EXT2_N_BLOCKS && dir->rec_len && dir->name_len && accumulated_len < EXT2_BLOCK_SIZE; j++)
        // {
        //     // printf("******************\n");
        //     printstr(dir->name);
        //     printNumberVar(dir->name_len);
        //     printNumberVar(dir->rec_len);
        //     printNumberVar(dir->inode);
        //     accumulated_len += dir->rec_len;
        //     dir = (ext2_dir_entry *)((uint8_t *)dir + dir->rec_len);

        //     if (strlen(dir->name) && strcmp(dir->name, ".") && strcmp(dir->name, ".."))
        //     {
        //         // printf("&&&&&&&&&&&&&&&& enter %s\n", dir->name);
        //         print_ext2_inode(inode_table, &inode_table[dir->inode - 1], depth + 1);
        //     }
        // }
    }
    else if (S_ISREG(inode->i_mode))
    {
        println("is a file inode");
        uint32_t j;
        for (j = 0; j < EXT2_IND_BLOCK && j < inode->i_blocks && inode->i_block[j]; j++)
        {
            // printf("+++++++data block++++++\n");
            printNumberVar(inode->i_block[j]);
            printNumberVar(inode->i_size);
            // char *content = (char *)&(buffer[inode->i_block[j] * EXT2_BLOCK_SIZE]);
            // printf("%s\n", content);
        }
    }
    else
    {
        println("maybe a data block");
    }
}

uint32_t read_ext2_super_block(uint8_t *buf)
{
    return read_ext2_data_block(buf, EXT2_FIRST_SB_BLKID);
}

uint32_t read_ext2_group_desc(uint8_t *buf, ext2_super_block *sb, uint32_t group_id)
{
    uint32_t start_blk_id = EXT2_FIRST_GD_BLKID + group_id * sizeof(ext2_group_desc) / EXT2_BLOCK_SIZE;
    printNumberVar(start_blk_id);
    read_ext2_data_block(buf, start_blk_id);
    memmove(buf, buf + sizeof(ext2_group_desc) * group_id, sizeof(ext2_group_desc));
    return 0;
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

uint32_t read_ext2_inode(uint8_t *buf, ext2_super_block *sb, uint32_t inode_id)
{
    printStringVar(__FUNCTION__);
    printNumberVar(inode_id);
    uint32_t group_id = (inode_id - 1) / sb->s_blocks_per_group;
    uint32_t gd_blk_id = EXT2_FIRST_GD_BLKID + group_id * sizeof(ext2_group_desc) / EXT2_BLOCK_SIZE;
    printNumberVar(gd_blk_id);

    uint32_t gd_blk_offset = group_id * sizeof(ext2_group_desc) % EXT2_BLOCK_SIZE;
    read_ext2_data_block(buf, gd_blk_id);
    ext2_group_desc *gd = (ext2_group_desc *)(buf + gd_blk_offset);

    uint32_t inode_blk_id = gd->bg_inode_table + (inode_id - 1) * sizeof(ext2_inode) / EXT2_BLOCK_SIZE;
    printNumberVar(gd->bg_inode_table);
    printNumberVar(inode_blk_id);

    uint32_t inode_blk_offset = (inode_id - 1) * sizeof(ext2_inode) % EXT2_BLOCK_SIZE;
    read_ext2_data_block(buf, inode_blk_id);

    ext2_inode *inode = (ext2_inode *)(buf + inode_blk_offset);

    printNumberVar(inode->i_size);
    printNumberVar(inode->i_blocks);

    memmove(buf, buf + inode_blk_offset, sizeof(ext2_inode));
    return 0;
}

uint32_t read_ext2_data_block(uint8_t *buf, uint32_t block_id)
{
    read_blk(buf, block_id + EXT2_FS_BLKID);
    return 0;
}

uint32_t walk_dir(ext2_inode *inode)
{
    int i;
    ext2_dir_entry *dir = 0;
    char buf[EXT2_BLOCK_SIZE];
    for (i = 0; i < inode->i_blocks && inode->i_block[i]; i++)
    {
        printNumberVar(i);
        uint32_t data_blk_id = inode->i_block[i] + EXT2_FS_BLKID;
        read_blk(buf, data_blk_id);
        dir = (ext2_dir_entry *)buf;
        int j;
        for (j = 0; j < EXT2_BLOCK_SIZE; j += dir->rec_len)
        {
            printStringVar(dir->name);
            printNumberVar(dir->rec_len);
            printNumberVar(dir->inode);
            dir = (ext2_dir_entry *)((uint8_t *)dir + dir->rec_len);
        }
    }
}

uint32_t get_inode(ext2_inode *inode, const char *name) // (parent inode, target dir name) => target dir inode number
{
    int i;
    ext2_dir_entry *dir = 0;
    char buf[EXT2_BLOCK_SIZE];
    for (i = 0; i < inode->i_blocks && inode->i_block[i]; i++)
    {
        // printNumberVar(i);
        uint32_t data_blk_id = inode->i_block[i] + EXT2_FS_BLKID;
        read_blk(buf, data_blk_id);
        dir = (ext2_dir_entry *)buf;
        int j;
        for (j = 0; j < EXT2_BLOCK_SIZE; j += dir->rec_len)
        {
            // printStringVar(dir->name);
            // printNumberVar(dir->rec_len);
            // printNumberVar(dir->inode);
            if (!strcmp(dir->name, name))
            {
                return dir->inode;
            }
            dir = (ext2_dir_entry *)((uint8_t *)dir + dir->rec_len);
        }
    }
    panic("inode not found by name");
    return 0;
}

uint32_t read_file(uint8_t *buf, ext2_inode *inode)
{
    printStringVar(__FUNCTION__);
    uint32_t cnt = 0;
    uint32_t i;

    for (i = 0; i < inode->i_blocks && i < EXT2_IND_BLOCK && inode->i_block[i]; i++)
    {
        read_ext2_data_block(buf + i * EXT2_BLOCK_SIZE, inode->i_block[i]);
        cnt++;
    }

    if (inode->i_blocks < EXT2_IND_BLOCK)
    {
        return;
    }

    if (inode->i_blocks >= EXT2_IND_BLOCK && inode->i_block[EXT2_IND_BLOCK])
    {
        println("read indirect block");
        uint8_t ind_blk[EXT2_BLOCK_SIZE] = {0};
        read_ext2_data_block(ind_blk, inode->i_block[EXT2_IND_BLOCK]);
        uint32_t *ptr = (uint32_t *)ind_blk;
        while (*ptr)
        {
            read_ext2_data_block(buf + cnt * EXT2_BLOCK_SIZE, *ptr);
            cnt++;
        }
    }
    if (inode->i_blocks >= EXT2_DIND_BLOCK && inode->i_block[EXT2_DIND_BLOCK])
    {
        println("read double indirect block");
    }
    if (inode->i_blocks >= EXT2_TIND_BLOCK && inode->i_block[EXT2_TIND_BLOCK])
    {
        println("read triple indirect block");
    }
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
