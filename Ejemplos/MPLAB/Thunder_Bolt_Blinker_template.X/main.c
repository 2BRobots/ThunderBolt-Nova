/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/
#define REMAPED_RESET_VECTOR_ADDRESS 0X1000                       //Edited for thundebolt bootloader
#pragma code REMAPED_RESET_VECTOR = REMAPED_RESET_VECTOR_ADDRESS //Edited for thundebolt bootloader

#if defined(__XC)
    #include <xc.h>        /* XC8 General Include File */
#elif defined(HI_TECH_C)
    #include <htc.h>       /* HiTech General Include File */
#elif defined(__18CXX)
    #include <p18cxxx.h>   /* C18 General Include File */
#endif

#if defined(__XC) || defined(HI_TECH_C)

#include <stdint.h>        /* For uint8_t definition */
#include <stdbool.h>       /* For true/false definition */

#endif
#include <p18f14k50.h>
#include "system.h"        /* System funct/params, like osc/peripheral config */
#include "user.h"          /* User funct/params, such as InitApp */
#include "delays.h"

/******************************************************************************/
/* User Global Variable Declaration                                           */
/******************************************************************************/

/* i.e. uint8_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

void main(void)
{
    /* Configure the oscillator for the device */
    ConfigureOscillator();

    /* Initialize I/O and Peripherals for application */
    InitApp();          

    /* TODO <INSERT USER APPLICATION CODE HERE> */
    while(1)
    {
        LATBbits.LATB7 = 1;
        Delay10KTCYx(250);  // note: max single delay in a thunderbolt is 
        Delay10KTCYx(250);  // (48e6)^-1 * 4 * 10000 * 255 = 0.2125s
        Delay10KTCYx(100);
        LATBbits.LATB7 = 0;
        Delay10KTCYx(250);
        Delay10KTCYx(250);
        Delay10KTCYx(100);
    }
    

}
//see linker scripts in help


