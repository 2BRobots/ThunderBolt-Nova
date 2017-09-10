#line 1 "C:/Users/ciro_/Desktop/blynkInterrupt/blynkInterrupt.c"
#pragma orgall 0x1000
#pragma funcorg bootInterrupt 0x1000
#pragma funcorg main 0x2000
#pragma funcall main bootInterrupt
#line 15 "C:/Users/ciro_/Desktop/blynkInterrupt/blynkInterrupt.c"
int var1 = 0;
int var2 = 0;
int var3 = 0;

void interrupt()

{

 if (INTCON.f2 == 1)

 {

 T0CON.f7 = 0;

 INTCON.f2 = 0;

 TMR0H = 0x0;

 TMR0L = 0x0;

  LATB.f7  = ! LATB.f7 ;



 if(var1 == 10)
 {
  LATC.f0  = ! LATC.f0 ;
 var1=0;
 }
 else
 {
 var1 = var1 + 1;
 }
 if(var2 == 100)
 {
  LATC.f1  = ! LATC.f1 ;
 var2=0;
 }
 else
 {
 var2 = var2 + 1;
 }
 if(var3 == 500)
 {
  LATC.f2  = ! LATC.f2 ;
 var3=0;
 }
 else
 {
 var3 = var3 + 1;
 }
 T0CON.f7 = 1;

 }

}





void main()

{

TRISA= 0b00001000;

TRISB= 0b00000000;

TRISC= 0b00000000;




LATA = 0;

LATB = 0;

LATC = 0;




T0CON = 0b00000001;

TMR0H = 0x0;

TMR0L = 0x0;

INTCON = 0b11100000;

RCON.f7 = 0;

T0CON.f7 = 1;




while(1)

{

if (PORTA.f3 == 0)

{

asm goto 0x30

}

delay_ms(100);



}

}




void bootInterrupt()

{

 asm {

 goto _main

 goto 0

 goto _interrupt

 }

}
