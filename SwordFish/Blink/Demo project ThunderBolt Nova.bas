Device = 18F14K50            //Microcontrolador que se estara usando
Clock = 48                   //Frecuencia de operacion en Mhz del microcontrolador

#option org_reset = $1000          //En esta direccion termina el bootloader y empieza el programa de usuario
#option vector_isr_hi = $1008      //Vector de redireccionamiento de interrupciones de alta prioridad
#option vector_isr_lo = $1018      //Vector de redireccionamiento de interrupciones de baja prioridad

Config
    CPUDIV = NOCLKDIV,  // No CPU System Clock divide
    USBDIV = OFF,       // USB clock comes directly from the OSC1/OSC2 oscillator block; no divide
    FOSC = HS,          // HS oscillator
    PLLEN = ON,         // Oscillator multiplied by 4
    PCLKEN = ON,        // Primary clock enabled
    FCMEN = OFF,        // Fail-Safe Clock Monitor disabled
    IESO = OFF,         // Oscillator Switchover mode disabled
    PWRTEN = ON,        // PWRT enabled
    BOREN = ON,         // Brown-out Reset enabled and controlled by software (SBOREN is enabled)
    BORV = 22,          // VBOR set to 2.2 V nominal
    WDTEN = OFF,        // WDT is controlled by SWDTEN bit of the WDTCON register
    WDTPS = 32768,      // 1:32768
    HFOFST = OFF,       // The system clock is held off until the HFINTOSC is stable.
    MCLRE = OFF,        // RA3 input pin enabled; MCLR disabled
    STVREN = ON,        // Stack full/underflow will cause Reset
    LVP = OFF,          // Single-Supply ICSP disabled
    BBSIZ = OFF,        // 1kW boot block size
    XINST = OFF,        // Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
    DEBUG = OFF,        // Background debugger disabled, RA0 and RA1 configured as general purpose I/O pins
    CP0 = OFF,          // Block 0 not code-protected
    CP1 = OFF,          // Block 1 not code-protected
    CPB = OFF,          // Boot block not code-protected
    CPD = OFF,          // Data EEPROM not code-protected
    WRT0 = OFF,         // Block 0 not write-protected
    WRT1 = OFF,         // Block 1 not write-protected
    WRTC = OFF,         // Configuration registers not write-protected
    WRTB = OFF,         // Boot block not write-protected
    WRTD = OFF,         // Data EEPROM not write-protected
    EBTR0 = OFF,        // Block 0 not protected from table reads executed in other blocks
    EBTR1 = OFF,        // Block 1 not protected from table reads executed in other blocks
    EBTRB = OFF         // Boot block not protected from table reads executed in other blocks


Start:   // Tu programa empieza justo aqui ;)

TRISB.7 = 0

loop:
PORTB.7 = 1
DelayMS(500)
PORTB.7 = 0
DelayMS(500)

If PORTA.3 = 0 Then
Asm 
GoTo 0x30 
End Asm 
EndIf

GoTo loop

End  //Aqui termina tu programa
