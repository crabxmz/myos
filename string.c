#include "string.h"
uint32_t strlen(char *a)
{
    uint32_t i = 0;
    while (*a)
    {
        a++;
        i++;
    }
    return i;
}

int strcmp(const char *a, const char *b)
{
    while (*a && *b)
    {
        if (*a > *b)
        {
            return 1;
        }
        if (*a < *b)
        {
            return -1;
        }
        a++;
        b++;
    }

    if (*a > *b)
    {
        return 1;
    }
    else if (*a < *b)
    {
        return -1;
    }
    else
    {
        return 0;
    }
}

uint32_t memmove(uint8_t *dst, uint8_t *src, uint32_t len)
{
    if (dst < src)
    {
        int i;
        for (i = 0; i < len; i++)
        {
            *(dst + i) = *(src + i);
        }
    }
    else if (dst > src)
    {
        while (len--)
        {
            *(dst + len) = *(src + len);
        }
    }
    return 0;
}