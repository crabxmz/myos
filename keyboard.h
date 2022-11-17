

/*

https://wiki.osdev.org/%228042%22_PS/2_Controller

IO Port    Access Type     Purpose
0x60       Read/Write      Data Port
0x64       Read            Status Register
0x64       Write           Command Register
*/
#ifndef KEYBOARD_H
#define KEYBOARD_H

#include "x86.h"
#include "idt.h"
#include "log.h"
#include "pic.h"
#include "type.h"

#define PS2_DATA_PORT 0x60
#define PS2_CTRL_PORT 0x64

uint8_t ps2_flush_data_output()
{
    uint8_t output = 0;
    while (inb(PS2_CTRL_PORT) & 1)
    {
        output = inb(PS2_DATA_PORT);
    }
    return output;
}

void ps2_flush_cmd_input()
{
    while (inb(PS2_CTRL_PORT) & (1 << 1))
    {
        io_wait();
    }
}

uint8_t ps2_wait_for_get_data()
{
    while (inb(PS2_CTRL_PORT) & 1 == 0)
    {
        io_wait();
    }
    return inb(PS2_DATA_PORT);
}

void ps2_wait_for_send_data(uint8_t c)
{
    outb(PS2_DATA_PORT, c);
    while (inb(PS2_CTRL_PORT) & (1 << 1))
    {
        io_wait();
    }
}

void ps2_wait_for_send_cmd(uint8_t c)
{
    outb(PS2_CTRL_PORT, c);
    while (inb(PS2_CTRL_PORT) & (1 << 1))
    {
        io_wait();
    }
}

void ps2_clear_and_send_cmd(uint8_t x)
{
    ps2_flush_data_output();
    ps2_flush_cmd_input();
    outb(PS2_CTRL_PORT, x);
}

void ps2_clear_and_set_data(uint8_t x)
{
    ps2_flush_data_output();
    outb(PS2_DATA_PORT, x);
}

uint8_t ps2_get_conf_byte()
{
    ps2_wait_for_send_cmd(0x20);
    uint8_t configByte = ps2_wait_for_get_data();
    // printuint32(configByte);
    // println(" ps2 controller configuration byte");
    return configByte;
}

void get_scancode_set()
{
    ps2_wait_for_send_cmd(0xF0);
    printuint32(inb(PS2_DATA_PORT));
    println(" get_scancode_set");
}

void detect_ps2_type()
{
    println("detect_ps2_type");
    uint16_t keyid = 0;
    ps2_wait_for_send_data(0xf5);
    if (ps2_wait_for_get_data() != 0xfa)
    {
        println(" disable kbd failed");
    }

    ps2_wait_for_send_data(0xf2);
    if (ps2_wait_for_get_data() != 0xfa)
    {
        println(" get kbd id failed");
    }
    int cnt = 2;
    while (cnt--)
    {
        keyid >>= 8;
        keyid |= (ps2_wait_for_get_data() << 8);
    }
    printuint32(keyid);
    println(" kbd id");
    println("detect_ps2_type done");
}

void initPS2(void)
{
    if (is_interrupt_enabled())
    {
        disable_interrupt();
        println("disable interrupt");
    }
    ps2_flush_data_output();
    // Step 1: Initialise USB Controllers
    // Step 2: Determine if the PS/2 Controller Exists

    // Step 3: Disable Devices

    ps2_clear_and_send_cmd(0xAD);
    ps2_clear_and_send_cmd(0xA7);

    // Step 4: Flush The Output Buffer
    // Step 5: Set the Controller Configuration Byte
    uint8_t configByte = ps2_get_conf_byte();
    if (configByte & (1 << 5))
    {
        println("is a dual channel PS/2 controller");
    }
    else
    {
        println("can't be a dual channel PS/2 controller");
    }

    configByte &= ~(1 << 0);
    configByte &= ~(1 << 1);
    configByte &= ~(1 << 6);

    ps2_clear_and_send_cmd(0x60);
    ps2_clear_and_set_data(configByte);
    // Step 6: Perform Controller Self Test
    ps2_clear_and_send_cmd(0xAA);
    uint8_t inb_60;

    if ((inb_60 = ps2_flush_data_output()) != (uint8_t)0x55)
    {
        printuint32(inb_60);
        println(" Self check failed!");
    }

    // Step 7: Determine If There Are 2 Channels
    // already has dual ports in step 5
    // Step 8: Perform Interface Tests

    ps2_clear_and_send_cmd(0xab);
    if (ps2_flush_data_output())
    {
        println("1st interface test failed");
    }

    ps2_clear_and_send_cmd(0xa9);
    if (ps2_flush_data_output())
    {
        println("2nd interface test failed");
    }

    // Step 9: Enable Devices
    ps2_clear_and_send_cmd(0xAE);
    ps2_clear_and_send_cmd(0xA8);
    // enable interrupt
    configByte = ps2_get_conf_byte();

    configByte |= 0x3;

    ps2_clear_and_send_cmd(0x60);
    ps2_clear_and_set_data(configByte);

    configByte = ps2_get_conf_byte();
    // Step 10: Reset Devices,keyboard should return ACK
    ps2_clear_and_set_data(0xff);

    if (ps2_wait_for_get_data() != 0xfa)
    {
        println("Reset Devices wait for 0xfa failed");
    }
    if (ps2_wait_for_get_data() != 0xaa)
    {
        println("Reset Devices wait for 0xaa failed");
    }

    // step 11: disable keyboard, should return ACK
    ps2_wait_for_send_data(0xf5);
    if (ps2_wait_for_get_data() != 0xfa)
    {
        println("disable keyboard wait for 0xfa failed");
    }

    // step 12: Write Keyboard Mode
    ps2_wait_for_send_cmd(0x60);

    // step 13: scan code convert, disable mouse, enable IRQ 1
    ps2_wait_for_send_data(0x61);

    // step 14: enable keyboard
    ps2_wait_for_send_data(0xf4);
    if (ps2_wait_for_get_data() != 0xfa)
    {
        println("enable keyboard wait for 0xfa failed");
    }
}

void init_ps2()
{
    println("init_ps2");

    // Step 1: Initialise USB Controllers
    // Step 2: Determine if the PS/2 Controller Exists

    // Step 3: Disable Devices
    ps2_wait_for_send_cmd(0xAD);
    ps2_wait_for_send_cmd(0xA7);
    // Step 4: Flush The Output Buffer
    ps2_flush_data_output();

    // Step 5: Set the Controller Configuration Byte
    uint8_t configByte = ps2_get_conf_byte();
    if (configByte & (1 << 5))
    {
        println("is a dual channel PS/2 controller");
    }
    else
    {
        println("can't be a dual channel PS/2 controller");
    }

    configByte &= ~(1 << 0);
    configByte &= ~(1 << 1);
    configByte &= ~(1 << 6);

    ps2_wait_for_send_cmd(0x60);
    ps2_wait_for_send_data(configByte);
    // Step 6: Perform Controller Self Test
    ps2_wait_for_send_cmd(0xaa);

    if (ps2_wait_for_get_data() != 0x55)
    {
        println(" self check failed!");
    }

    // Step 7: Determine If There Are 2 Channels
    // already has dual ports in step 5
    // Step 8: Perform Interface Tests

    ps2_wait_for_send_cmd(0xab);
    if (ps2_wait_for_get_data())
    {
        println(" 1st interface test failed");
    }

    // Step 9: Enable Keyboard clock
    outb(PS2_CTRL_PORT, 0xae);
    outb(PS2_CTRL_PORT, 0xa8);

    // Step 10: Reset Devices,keyboard should return ACK
    ps2_wait_for_send_data(0xff);

    if (ps2_wait_for_get_data() != 0xfa)
    {
        println(" Reset Devices wait for 0xfa failed");
    }
    if (ps2_wait_for_get_data() != 0xaa)
    {
        println(" Reset Devices wait for 0xaa failed");
    }

    // step 11: disable keyboard, should return ACK
    // ps2_wait_for_send_data(0xf5);
    // if (ps2_wait_for_get_data() != 0xfa)
    // {
    //     println(" disable keyboard wait for 0xfa failed");
    // }

    // // step 12: Write Keyboard Mode
    // ps2_wait_for_send_cmd(0x60);

    // // step 13: scan code convert, disable mouse, enable IRQ 1
    // ps2_wait_for_send_data(0x61);

    // // step 14: enable keyboard
    // ps2_wait_for_send_data(0xf4);
    // if (ps2_wait_for_get_data() != 0xfa)
    // {
    //     println(" enable keyboard wait for 0xfa failed");
    // }
    // io_wait();
    println("init_ps2 done");
}

void test_ps2()
{
    uint8_t i = 1;
    while (i < 256)
    {

        printuint32(i);
        println(" send cmd byte");
        ps2_wait_for_send_cmd(i);

        printuint32(ps2_wait_for_get_data());
        println(" get data rsp bytes");

        // ps2_wait_for_send_cmd(0xff);
        i += 2;
    }
}

#endif