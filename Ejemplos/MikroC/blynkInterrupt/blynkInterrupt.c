#pragma orgall 0x1000  //le digo al compilador que comience al programa en la dirección de memoria 0x1000

#pragma funcorg bootInterrupt 0x1000 //pongo al principio de la memoria la funcion de salto para llamar al programa principal y la interrupcion

#pragma funcorg main 0x2000 //direccion de inicio del programa principal
#pragma funcall main bootInterrupt //le digo al compilador que empieze a ejecutar el programa desde bootInterrupt, en lugar que desde el main



#define LED LATB.f7
#define LED2 LATC.f0
#define LED3 LATC.f1
#define LED4 LATC.f2

int var1 = 0;
int var2 = 0;
int var3 = 0;

void interrupt()

{

  if (INTCON.f2 == 1) //si se desborda el timer y acciona la interrupcion, este registro es una bandera

  {

    T0CON.f7 = 0; 

    INTCON.f2 = 0;

    TMR0H   = 0x0;

    TMR0L   = 0x0;

    LED = !LED; //parpadea led verde "st"  indicando que esta ocurriendo la interrupción


     
     if(var1 == 10)
     {
              LED2 = !LED2;
             var1=0;
     }
     else
     {
      var1 = var1 + 1;
     }
     if(var2 == 100)
     {
              LED3 = !LED3;
             var2=0;
     }
     else
     {
      var2 = var2 + 1;
     }
          if(var3 == 500)
     {
              LED4 = !LED4;
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

TMR0H   = 0x0;

TMR0L   = 0x0;

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