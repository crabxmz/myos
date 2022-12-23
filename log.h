#ifndef LOG_H
#define LOG_H
#include "type.h"
#define SERIAL_PORT (0x03f8)

void putchar(char x);
void print(const char *a);
void printhex(uint8_t a);
void println(const char *a);
void printuint32(uint32_t a);
void print_str_and_uint32(const char *a, uint32_t x);
void stub();
void dump_mem(const uint8_t*a, uint32_t len);
#define printNumberVar(x) print_str_and_uint32(#x, (x));
#define printStringVar(x) print(#x);putchar(' ');println(x);

#endif