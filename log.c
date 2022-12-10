#include "log.h"
#include "x86.h"

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

void println(const char *a)
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

void print_str_and_uint32(const char *a,uint32_t x)
{
    print(a);
    putchar(' ');
    printuint32(x);
    println("");
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

void stub()
{
    print_str_and_uint32("stub", (uint32_t)stub);
}