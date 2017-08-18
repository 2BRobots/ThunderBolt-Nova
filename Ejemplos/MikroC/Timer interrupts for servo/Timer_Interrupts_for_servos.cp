#line 1 "E:/ciro_/Documents/GitHub/ThunderBolt-Nova/MikroC/Timer interrupts for servo/Timer_Interrupts_for_servos.c"
#pragma orgall 0x1000
#pragma funcorg bootInterrupt 0x1000
#pragma funcorg main 0x102A
#pragma funcall main bootInterrupt
#line 10 "E:/ciro_/Documents/GitHub/ThunderBolt-Nova/MikroC/Timer interrupts for servo/Timer_Interrupts_for_servos.c"
int pulso = 0;
int ServoC5 = 0;
int ServoC4 = 0;

void interrupt()
{
 if (INTCON.f2 == 1)
 {
 T0CON.f7 = 0;
 INTCON.f2 = 0;
 TMR0H = 0x15;
 TMR0L = 0xA0;
 LATB.f7 = !LATB.f7;

  LATC.f5  = 1;
 delay_us(600);
 for(pulso = 0; pulso <= ServoC5; pulso++)
 {
 delay_us(9);
 }
  LATC.f5  = 0;

  LATC.f4  = 1;
 delay_us(600);
 for(pulso = 0; pulso <= ServoC4; pulso++)
 {
 delay_us(9);
 }
  LATC.f4  = 0;

 T0CON.f7 = 1;
 }
}

int i = 0;

void main()
{
TRISA= 0b00001000;
TRISB= 0b00000000;
TRISC= 0b00000000;

LATA = 0;
LATB = 0;
LATC = 0;

T0CON = 0b00000001;
TMR0H = 0x15;
TMR0L = 0xA0;
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

for(i = 0; i<=180;i++)
{
ServoC5 = i;
delay_ms(1);
}

for(i = 0; i<=180;i++)
{
ServoC4 = i;
delay_ms(20);
}

for(i = 180; i>=0;i--)
{
ServoC5 = i;
delay_ms(1);
}

for(i = 180; i>=0;i--)
{
ServoC4 = i;
delay_ms(20);
}


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
