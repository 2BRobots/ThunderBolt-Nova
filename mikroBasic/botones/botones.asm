
_main:

;botones.mbas,6 :: 		org 0x1000
;botones.mbas,8 :: 		TRISC = %01110000
	MOVLW       112
	MOVWF       TRISC+0 
;botones.mbas,9 :: 		LATC = %00000000
	CLRF        LATC+0 
;botones.mbas,10 :: 		UART1_init(9600)
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;botones.mbas,11 :: 		anselh.3 = 0
	BCF         ANSELH+0, 3 
;botones.mbas,12 :: 		TRISB.5 = 1
	BSF         TRISB+0, 5 
;botones.mbas,13 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;botones.mbas,14 :: 		loop:
L__main_loop:
;botones.mbas,15 :: 		latc.3 = 0         '   fila 1
	BCF         LATC+0, 3 
;botones.mbas,16 :: 		latc.0 = 1
	BSF         LATC+0, 0 
;botones.mbas,17 :: 		latc.1 = 0
	BCF         LATC+0, 1 
;botones.mbas,18 :: 		latc.2 = 0
	BCF         LATC+0, 2 
;botones.mbas,19 :: 		while portc.4 = 1
L__main3:
	BTFSS       PORTC+0, 4 
	GOTO        L__main4
;botones.mbas,20 :: 		UART_write("1")
	MOVLW       49
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,21 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main7:
	DECFSZ      R13, 1, 1
	BRA         L__main7
	DECFSZ      R12, 1, 1
	BRA         L__main7
	DECFSZ      R11, 1, 1
	BRA         L__main7
	NOP
	NOP
;botones.mbas,22 :: 		wend
	GOTO        L__main3
L__main4:
;botones.mbas,23 :: 		while portc.5 = 1
L__main9:
	BTFSS       PORTC+0, 5 
	GOTO        L__main10
;botones.mbas,24 :: 		UART_write("2")
	MOVLW       50
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,25 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main13:
	DECFSZ      R13, 1, 1
	BRA         L__main13
	DECFSZ      R12, 1, 1
	BRA         L__main13
	DECFSZ      R11, 1, 1
	BRA         L__main13
	NOP
	NOP
;botones.mbas,26 :: 		wend
	GOTO        L__main9
L__main10:
;botones.mbas,27 :: 		while portc.6 = 1
L__main15:
	BTFSS       PORTC+0, 6 
	GOTO        L__main16
;botones.mbas,28 :: 		UART_write("3")
	MOVLW       51
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,29 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main19:
	DECFSZ      R13, 1, 1
	BRA         L__main19
	DECFSZ      R12, 1, 1
	BRA         L__main19
	DECFSZ      R11, 1, 1
	BRA         L__main19
	NOP
	NOP
;botones.mbas,30 :: 		wend
	GOTO        L__main15
L__main16:
;botones.mbas,31 :: 		latc.0 = 0         '   fila 2
	BCF         LATC+0, 0 
;botones.mbas,32 :: 		latc.1 = 1
	BSF         LATC+0, 1 
;botones.mbas,33 :: 		latc.3 = 0
	BCF         LATC+0, 3 
;botones.mbas,34 :: 		latc.2 = 0
	BCF         LATC+0, 2 
;botones.mbas,35 :: 		while portc.4 = 1
L__main21:
	BTFSS       PORTC+0, 4 
	GOTO        L__main22
;botones.mbas,36 :: 		UART_write("4")
	MOVLW       52
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,37 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main25:
	DECFSZ      R13, 1, 1
	BRA         L__main25
	DECFSZ      R12, 1, 1
	BRA         L__main25
	DECFSZ      R11, 1, 1
	BRA         L__main25
	NOP
	NOP
;botones.mbas,38 :: 		wend
	GOTO        L__main21
L__main22:
;botones.mbas,39 :: 		while portc.5 = 1
L__main27:
	BTFSS       PORTC+0, 5 
	GOTO        L__main28
;botones.mbas,40 :: 		UART_write("5")
	MOVLW       53
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,41 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main31:
	DECFSZ      R13, 1, 1
	BRA         L__main31
	DECFSZ      R12, 1, 1
	BRA         L__main31
	DECFSZ      R11, 1, 1
	BRA         L__main31
	NOP
	NOP
;botones.mbas,42 :: 		wend
	GOTO        L__main27
L__main28:
;botones.mbas,43 :: 		while portc.6 = 1
L__main33:
	BTFSS       PORTC+0, 6 
	GOTO        L__main34
;botones.mbas,44 :: 		UART_write("6")
	MOVLW       54
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,45 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main37:
	DECFSZ      R13, 1, 1
	BRA         L__main37
	DECFSZ      R12, 1, 1
	BRA         L__main37
	DECFSZ      R11, 1, 1
	BRA         L__main37
	NOP
	NOP
;botones.mbas,46 :: 		wend
	GOTO        L__main33
L__main34:
;botones.mbas,47 :: 		portc.1 = 0         '   fila 3
	BCF         PORTC+0, 1 
;botones.mbas,48 :: 		portc.2 = 1
	BSF         PORTC+0, 2 
;botones.mbas,49 :: 		latc.0 = 0
	BCF         LATC+0, 0 
;botones.mbas,50 :: 		latc.3 = 0
	BCF         LATC+0, 3 
;botones.mbas,51 :: 		while portc.4 = 1
L__main39:
	BTFSS       PORTC+0, 4 
	GOTO        L__main40
;botones.mbas,52 :: 		UART_write("7")
	MOVLW       55
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,53 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main43:
	DECFSZ      R13, 1, 1
	BRA         L__main43
	DECFSZ      R12, 1, 1
	BRA         L__main43
	DECFSZ      R11, 1, 1
	BRA         L__main43
	NOP
	NOP
;botones.mbas,54 :: 		wend
	GOTO        L__main39
L__main40:
;botones.mbas,55 :: 		while portc.5 = 1
L__main45:
	BTFSS       PORTC+0, 5 
	GOTO        L__main46
;botones.mbas,56 :: 		UART_write("8")
	MOVLW       56
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,57 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main49:
	DECFSZ      R13, 1, 1
	BRA         L__main49
	DECFSZ      R12, 1, 1
	BRA         L__main49
	DECFSZ      R11, 1, 1
	BRA         L__main49
	NOP
	NOP
;botones.mbas,58 :: 		wend
	GOTO        L__main45
L__main46:
;botones.mbas,59 :: 		while portc.6 = 1
L__main51:
	BTFSS       PORTC+0, 6 
	GOTO        L__main52
;botones.mbas,60 :: 		UART_write("9")
	MOVLW       57
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,61 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main55:
	DECFSZ      R13, 1, 1
	BRA         L__main55
	DECFSZ      R12, 1, 1
	BRA         L__main55
	DECFSZ      R11, 1, 1
	BRA         L__main55
	NOP
	NOP
;botones.mbas,62 :: 		wend
	GOTO        L__main51
L__main52:
;botones.mbas,63 :: 		portc.2 = 0         '   fila 4
	BCF         PORTC+0, 2 
;botones.mbas,64 :: 		portc.3 = 1
	BSF         PORTC+0, 3 
;botones.mbas,65 :: 		latc.0 = 0
	BCF         LATC+0, 0 
;botones.mbas,66 :: 		latc.1 = 0
	BCF         LATC+0, 1 
;botones.mbas,67 :: 		while portc.4 = 1
L__main57:
	BTFSS       PORTC+0, 4 
	GOTO        L__main58
;botones.mbas,68 :: 		UART_write("*")
	MOVLW       42
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,69 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main61:
	DECFSZ      R13, 1, 1
	BRA         L__main61
	DECFSZ      R12, 1, 1
	BRA         L__main61
	DECFSZ      R11, 1, 1
	BRA         L__main61
	NOP
	NOP
;botones.mbas,70 :: 		wend
	GOTO        L__main57
L__main58:
;botones.mbas,71 :: 		while portc.5 = 1
L__main63:
	BTFSS       PORTC+0, 5 
	GOTO        L__main64
;botones.mbas,72 :: 		UART_write("0")
	MOVLW       48
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,73 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main67:
	DECFSZ      R13, 1, 1
	BRA         L__main67
	DECFSZ      R12, 1, 1
	BRA         L__main67
	DECFSZ      R11, 1, 1
	BRA         L__main67
	NOP
	NOP
;botones.mbas,74 :: 		wend
	GOTO        L__main63
L__main64:
;botones.mbas,75 :: 		while portc.6 = 1
L__main69:
	BTFSS       PORTC+0, 6 
	GOTO        L__main70
;botones.mbas,76 :: 		UART_write("#")
	MOVLW       35
	MOVWF       FARG_UART_Write_data_+0 
	CALL        _UART_Write+0, 0
;botones.mbas,77 :: 		delay_ms(250)
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L__main73:
	DECFSZ      R13, 1, 1
	BRA         L__main73
	DECFSZ      R12, 1, 1
	BRA         L__main73
	DECFSZ      R11, 1, 1
	BRA         L__main73
	NOP
	NOP
;botones.mbas,78 :: 		wend
	GOTO        L__main69
L__main70:
;botones.mbas,79 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
