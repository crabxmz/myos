#ifndef STRING_H
#define STRING_H
#include "type.h"
uint32_t strlen(char *a);
int strcmp(const char *a, const char *b);
uint32_t memmove(uint8_t  *dst, uint8_t  *src, uint32_t len);
#endif