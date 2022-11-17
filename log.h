#ifndef LOG_H
#define LOG_H
#include "type.h"
#include "x86.h"
#define SERIAL_PORT (0x03f8)

void putchar(char x)
{
    outb(SERIAL_PORT, (uint8_t)x);
    // io_wait();
}

void print(const char *a)
{
    for (; *a != '\0'; a++)
    {
        putchar(*a);
    }
}


void printhex(uint8_t a)
{
    if (a < 0xa)
    {
        putchar((char)(a + '0'));
    }
    else if (a <= 0xf)
    {
        putchar((char)(a - 0xa + 'a'));
    }
    else
    {
        putchar('?');
    }
}

void println(char *a)
{
    int i = 0;
    while (a[i])
    {
        putchar(a[i++]);
    }
    print("\n\r");
}

void printuint32(uint32_t a)
{
    int i = 8;
    uint32_t m = 0xf0000000;
    while (i--)
    {
        printhex((uint8_t)((a & m) >> (i * 4)));
        m >>= 4;
    }
}

int strlen(char *a)
{
    int i = 0;
    while (*a)
    {
        a++;
        i++;
    }
    return i;
}

#endif