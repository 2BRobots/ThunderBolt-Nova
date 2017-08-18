#line 1 "C:/Users/David Fernandez/Desktop/ServoADC/ServoADC.c"
#pragma orgall 0x1000
#line 4 "C:/Users/David Fernandez/Desktop/ServoADC/ServoADC.c"
void servo(int angulo)
{
int i;
if(angulo <= 0)
{
angulo = 0;
}
if (angulo >= 180)
{
angulo = 180;
}
 latc.f5  = 1;
delay_us(1000);
for(i = 0; i <= angulo; i++)
{
delay_us(6);
}
 latc.f5  = 0;
}

unsigned int ADC_Read(unsigned short Chan_Sel)
{
 unsigned int myReading;
 ADCON0 = Chan_Sel << 2;
 ADCON0.GO = 1;
 while(ADCON0.GO)
 {
 asm nop;
 }
 myReading = ADRESH << 8;
 myReading = myReading + ADRESL;
 return myReading;
}

int x;


void main() org 0x1000
{
trisc.f5=0;
trisb.f5=1;
anselh.f3=0;

while(1)
{
x = ADC_Read(11);
x = (x*180)/1023;
servo(x);
delay_ms(20);
}
}
