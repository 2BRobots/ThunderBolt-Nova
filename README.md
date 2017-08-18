# ThunderBolt-Nova
Here can be found all the resources to build your own ThunderBolt development board. This board is based on the PIC18F14K50 microcontroller. It uses a bootloader so you can program it directly over USB without an ICSP programer. 
If you decide to make your own board you will need to burn the bootloader the firts time. You can use the 12Mhz or 48Mhz version, the hardware is the same for both versions.

Note: For the servo ports you must pay attention to the pin names in the botton of the board, not the top. Wiring in some servo models will require a modification. Also there is an error in silkscreen, in C5 servo port in the botton says "C2" instead of "C5". 
Be careful, this ports where designed to drive micro-servos. Using full size (8kg.cm or greater) servos can destroy the board due to excesive current flow, please use external power for the servos in this case.  

![alt tag](https://github.com/DAFRELECTRONICS/ThunderBolt-Nova/blob/master/thunder.jpg?raw=true)

In this repositiry are all resources, examples and design files that will allow you to use all features of the board.

Here is a video of how to get started:

https://youtu.be/WCGcCIe8bug

Voltage Pinout:
GND = voltage ground.
EN  = this is the signal from the on/off switch, can be used for turn on/off addon boards.
VU  = this are the 5v from the USB port.
VB  = this is the voltage from the battery.
3V  = This is the regulated 3v output, it only can supply 200mA.

Also there is a shared pins for the internal LED (B7) and button (A3), this are used in the bootloader program but you can use it in your program too!!!  As an extra there is a voltage divider shared in the pin C6 (AN8) to measure the lipo battery voltage. 
For full diagram of conections and specs please see the board schematic and microcontroller datasheet. 

This board was designed to use a 1S litium battery (3.7v) and is equiped with an on board battery charger. Be careful when using one, wrong polarity can destroy your board!!!

Hope you find it useful and can make a lot of projects with it.

2B Robots (DAFR Electronics) invests time and resources providing this open source code and hardware, if you valorate our hard work please purchase our products and support us to continue creating more open source products!!!

Hardware licensed with Creative Commons BY-NC-SA.

Created by Daniel A. Fernandez Raygoza for 2B Robots.

Visit our online store: www.2brobots.com
