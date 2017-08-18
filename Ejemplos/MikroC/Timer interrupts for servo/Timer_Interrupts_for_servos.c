#pragma orgall 0x1000  //le digo al compilador que comienze al programa en la direccion de memoria 0x1000
#pragma funcorg bootInterrupt 0x1000 //pongo al principio de la memoria la funcion de salto para llamar al programa principal y la interrupcion
#pragma funcorg main 0x102A //direccion de inicio del programa principal
#pragma funcall main bootInterrupt //le digo al compilador que empieze a ejecutar el programa desde bootInterrupt, en lugar que desde el main


#define ServoPin1 LATC.f5
#define ServoPin2 LATC.f4

int pulso = 0;
int ServoC5 = 0;
int ServoC4 = 0;

void interrupt()
{
  if (INTCON.f2 == 1) //si se desborda el timer y acciona la interrupcion
  {
    T0CON.f7 = 0;
    INTCON.f2 = 0;
    TMR0H   = 0x15;
    TMR0L   = 0xA0;
    LATB.f7 = !LATB.f7; //parpadea led verde "st"  indicando que esta ocurriendo la interrupcion
    //Rutina de 1 servo
    ServoPin1 = 1;
    delay_us(600);
    for(pulso = 0; pulso <= ServoC5; pulso++)
    {
     delay_us(9);
    }
    ServoPin1 = 0;
    //Rutina de otro servo
    ServoPin2 = 1;
    delay_us(600);
    for(pulso = 0; pulso <= ServoC4; pulso++)
    {
     delay_us(9);
    }
    ServoPin2 = 0;

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
TMR0H   = 0x15;
TMR0L   = 0xA0;
INTCON = 0b11100000;
RCON.f7 = 0;
T0CON.f7 = 1;

while(1)
{
if (PORTA.f3 == 0) //este if verifica si el boton se presiona
{
asm goto 0x30   //saltar al bootloader para reprogramacion
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

void bootInterrupt()    //tabla de saltos para poder activar interrupciones usando un bootloader, manda llamar interrupciones y al main segun correponda
{
   asm {
   goto _main
   goto 0
   goto _interrupt
   }
}