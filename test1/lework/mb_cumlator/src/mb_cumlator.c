//mb_blink.c
//
//Provided boilerplate "LED Blink" code for ECE 385
//First released in ECE 385, Fall 2023 distribution
//
//Note: you will have to refer to the memory map of your MicroBlaze
//system to find the proper address for the LED GPIO peripheral.
//
//Modified on 7/25/23 Zuofu Cheng

#include <stdio.h>
#include <xparameters.h>
#include <xil_types.h>
#include <sleep.h>

#include "platform.h"

volatile uint32_t* led_gpio_data = 0x40000000;  //Hint: either find the manual address (via the memory map in the block diagram, or
volatile uint32_t* leswitch = 0x40010000;															 //replace with the proper define in xparameters (part of the BSP). Either way
volatile uint32_t* leButton = 0x40020000;															 //this is the base address of the GPIO corresponding to your LEDs
															 //(similar to 0xFFFF from MEM2IO from previous labs).

int main()
{
    init_platform();
    int sum = 0;
    int accum;
    int flag = 0;
	while (1) //while(1) ahh loop
	{
		accum = 0;
		if(*leButton == 1){
			if(flag == 0){
				accum = *leswitch;
				flag = 1;
			}
		} else{
			flag = 0;
		}
		sum = sum + accum;

		if(sum > 65535){
			printf("Overflow Error\n");
			sum = 0;
		}
		*led_gpio_data = sum;
	}

    cleanup_platform();

    return 0;
}
