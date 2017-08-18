#pragma orgall 0x1000
#define ServoPin latc.f5

void servo(int angulo) //para mantener el servo en su posicion esta funcion debe ser invocada cada 20 mili-segundos
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
ServoPin = 1;
delay_us(1000);
for(i = 0; i <= angulo; i++)
{
delay_us(6);
}
ServoPin = 0;
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