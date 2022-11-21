void test_high(unsigned char data)
{
    unsigned short port = 0x03f8;
    __asm__ volatile("outb %0, %1"
                     :
                     : "a"(data), "Nd"(port));
    while (1)
        ;
}