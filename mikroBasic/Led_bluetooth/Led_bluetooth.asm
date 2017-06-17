
_main:

;Led_bluetooth.mbas,8 :: 		org 0x1000
;Led_bluetooth.mbas,11 :: 		ANSELH.3 = 0
	BCF         ANSELH+0, 3 
;Led_bluetooth.mbas,12 :: 		TRISB.5 = 1
	BSF         TRISB+0, 5 
;Led_bluetooth.mbas,13 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;Led_bluetooth.mbas,14 :: 		TRISB.4 = 1
	BSF         TRISB+0, 4 
;Led_bluetooth.mbas,16 :: 		UART1_Init(9600)
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Led_bluetooth.mbas,18 :: 		UART1_Write_Text("Ejemplo bluetooth")
	MOVLW       69
	MOVWF       ?LocalText_main+0 
	MOVLW       106
	MOVWF       ?LocalText_main+1 
	MOVLW       101
	MOVWF       ?LocalText_main+2 
	MOVLW       109
	MOVWF       ?LocalText_main+3 
	MOVLW       112
	MOVWF       ?LocalText_main+4 
	MOVLW       108
	MOVWF       ?LocalText_main+5 
	MOVLW       111
	MOVWF       ?LocalText_main+6 
	MOVLW       32
	MOVWF       ?LocalText_main+7 
	MOVLW       98
	MOVWF       ?LocalText_main+8 
	MOVLW       108
	MOVWF       ?LocalText_main+9 
	MOVLW       117
	MOVWF       ?LocalText_main+10 
	MOVLW       101
	MOVWF       ?LocalText_main+11 
	MOVLW       116
	MOVWF       ?LocalText_main+12 
	MOVLW       111
	MOVWF       ?LocalText_main+13 
	MOVLW       111
	MOVWF       ?LocalText_main+14 
	MOVLW       116
	MOVWF       ?LocalText_main+15 
	MOVLW       104
	MOVWF       ?LocalText_main+16 
	CLRF        ?LocalText_main+17 
	MOVLW       ?LocalText_main+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?LocalText_main+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Led_bluetooth.mbas,19 :: 		UART1_Write(10)
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Led_bluetooth.mbas,20 :: 		UART1_Write(13)
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Led_bluetooth.mbas,22 :: 		loop:
L__main_loop:
;Led_bluetooth.mbas,23 :: 		if PORTA.3 = 0 then
	BTFSC       PORTA+0, 3 
	GOTO        L__main3
;Led_bluetooth.mbas,24 :: 		UART1_Write_Text("Hola")
	MOVLW       72
	MOVWF       ?LocalText_main+0 
	MOVLW       111
	MOVWF       ?LocalText_main+1 
	MOVLW       108
	MOVWF       ?LocalText_main+2 
	MOVLW       97
	MOVWF       ?LocalText_main+3 
	CLRF        ?LocalText_main+4 
	MOVLW       ?LocalText_main+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?LocalText_main+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Led_bluetooth.mbas,25 :: 		UART1_Write(10)
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Led_bluetooth.mbas,26 :: 		UART1_Write(13)
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Led_bluetooth.mbas,27 :: 		while(PORTA.3 = 0)
L__main6:
	BTFSS       PORTA+0, 3 
	GOTO        L__main6
;Led_bluetooth.mbas,28 :: 		wend
L__main3:
;Led_bluetooth.mbas,31 :: 		if (UART1_Data_Ready() <> 0) then
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main11
;Led_bluetooth.mbas,32 :: 		recibido = UART1_Read()
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _recibido+0 
;Led_bluetooth.mbas,33 :: 		uart1_write(recibido)
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
L__main11:
;Led_bluetooth.mbas,37 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
