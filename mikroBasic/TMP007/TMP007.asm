
_Get_Object_Temperature:

;TMP007.mbas,11 :: 		dim Temperature as float
;TMP007.mbas,13 :: 		I2C1_Start()                                               ' Issue I2C start signal
	CALL        _I2C1_Start+0, 0
;TMP007.mbas,14 :: 		I2C1_Wr(TMP007_I2C_ADDR)                                   ' Send Slave Address Byte
	MOVLW       128
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;TMP007.mbas,15 :: 		I2C1_Wr(0x03)                                              ' Pointer Register Byte
	MOVLW       3
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;TMP007.mbas,16 :: 		I2C1_Repeated_Start()                                      ' Issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;TMP007.mbas,17 :: 		I2C1_Wr(TMP007_I2C_ADDR+1)                                 ' Slave Address Byte incremented for one address
	MOVLW       129
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;TMP007.mbas,18 :: 		tmp_data[0] = I2C1_Rd(1)                                   ' Read High value from register address (0x03) and store it in tmp_data and send
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       Get_Object_Temperature_tmp_data+0 
;TMP007.mbas,20 :: 		tmp_data[1] = I2C1_Rd(_I2C_NACK)                           ' Read Low value from register address (0x03)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       Get_Object_Temperature_tmp_data+1 
;TMP007.mbas,21 :: 		I2C1_Stop()                                                ' Issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;TMP007.mbas,23 :: 		TemperatureSum = ((tmp_data[0] << 8) or tmp_data[1]) >> 2  ' Justify temperature values
	MOVF        Get_Object_Temperature_tmp_data+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        Get_Object_Temperature_tmp_data+1, 0 
	IORWF       R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVLW       0
	IORWF       R5, 1 
	MOVF        R4, 0 
	MOVWF       R2 
	MOVF        R5, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	BTFSC       R3, 6 
	BSF         R3, 7 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	BTFSC       R3, 6 
	BSF         R3, 7 
	MOVF        R2, 0 
	MOVWF       Get_Object_Temperature_TemperatureSum+0 
	MOVF        R3, 0 
	MOVWF       Get_Object_Temperature_TemperatureSum+1 
;TMP007.mbas,25 :: 		if(TemperatureSum and (1 << 13)) then                      ' Test negative bit
	BTFSS       R3, 5 
	GOTO        L__Get_Object_Temperature2
;TMP007.mbas,26 :: 		TemperatureSum = TemperatureSum or 0xE000                ' Set bits 11 to 15 to logic 1 to get this reading into real two complement
	MOVLW       0
	IORWF       Get_Object_Temperature_TemperatureSum+0, 1 
	MOVLW       224
	IORWF       Get_Object_Temperature_TemperatureSum+1, 1 
L__Get_Object_Temperature2:
;TMP007.mbas,29 :: 		Temperature = TemperatureSum * 0.03125                     ' Multiply temperature value with 0.03125 (value per bit)
	MOVF        Get_Object_Temperature_TemperatureSum+0, 0 
	MOVWF       R0 
	MOVF        Get_Object_Temperature_TemperatureSum+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       122
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;TMP007.mbas,31 :: 		result = Temperature
	MOVF        R0, 0 
	MOVWF       Get_Object_Temperature_local_result+0 
	MOVF        R1, 0 
	MOVWF       Get_Object_Temperature_local_result+1 
	MOVF        R2, 0 
	MOVWF       Get_Object_Temperature_local_result+2 
	MOVF        R3, 0 
	MOVWF       Get_Object_Temperature_local_result+3 
;TMP007.mbas,33 :: 		end sub
	MOVF        Get_Object_Temperature_local_result+0, 0 
	MOVWF       R0 
	MOVF        Get_Object_Temperature_local_result+1, 0 
	MOVWF       R1 
	MOVF        Get_Object_Temperature_local_result+2, 0 
	MOVWF       R2 
	MOVF        Get_Object_Temperature_local_result+3, 0 
	MOVWF       R3 
L_end_Get_Object_Temperature:
	RETURN      0
; end of _Get_Object_Temperature

_main:

;TMP007.mbas,36 :: 		org 0x1000
;TMP007.mbas,38 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;TMP007.mbas,39 :: 		TRISB.5 = 1
	BSF         TRISB+0, 5 
;TMP007.mbas,40 :: 		TRISB.4 = 0
	BCF         TRISB+0, 4 
;TMP007.mbas,41 :: 		TRISB.6 = 0
	BCF         TRISB+0, 6 
;TMP007.mbas,44 :: 		I2C1_Init(100000)
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;TMP007.mbas,45 :: 		UART1_Init(9600)
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;TMP007.mbas,46 :: 		delay_ms(200)
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L__main5:
	DECFSZ      R13, 1, 1
	BRA         L__main5
	DECFSZ      R12, 1, 1
	BRA         L__main5
	DECFSZ      R11, 1, 1
	BRA         L__main5
	NOP
	NOP
;TMP007.mbas,48 :: 		UART1_write_text("Demo TMP007")
	MOVLW       68
	MOVWF       ?LocalText_main+0 
	MOVLW       101
	MOVWF       ?LocalText_main+1 
	MOVLW       109
	MOVWF       ?LocalText_main+2 
	MOVLW       111
	MOVWF       ?LocalText_main+3 
	MOVLW       32
	MOVWF       ?LocalText_main+4 
	MOVLW       84
	MOVWF       ?LocalText_main+5 
	MOVLW       77
	MOVWF       ?LocalText_main+6 
	MOVLW       80
	MOVWF       ?LocalText_main+7 
	MOVLW       48
	MOVWF       ?LocalText_main+8 
	MOVLW       48
	MOVWF       ?LocalText_main+9 
	MOVLW       55
	MOVWF       ?LocalText_main+10 
	CLRF        ?LocalText_main+11 
	MOVLW       ?LocalText_main+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?LocalText_main+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TMP007.mbas,49 :: 		UART1_Write(10)                      ' Line Feed
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TMP007.mbas,50 :: 		UART1_Write(13)                      ' Carriage Return
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TMP007.mbas,53 :: 		loop:
L__main_loop:
;TMP007.mbas,54 :: 		Temperature_read = Get_Object_Temperature()              ' Store temperature value in Temperature_read
	CALL        _Get_Object_Temperature+0, 0
	CALL        _Double2Byte+0, 0
	MOVF        R0, 0 
	MOVWF       _Temperature_read+0 
;TMP007.mbas,55 :: 		UART1_write(Temperature_read)
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TMP007.mbas,56 :: 		UART1_Write(10)                      ' Line Feed
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TMP007.mbas,57 :: 		UART1_Write(13)                      ' Carriage Return
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TMP007.mbas,59 :: 		delay_ms(1010)
	MOVLW       62
	MOVWF       R11, 0
	MOVLW       125
	MOVWF       R12, 0
	MOVLW       23
	MOVWF       R13, 0
L__main7:
	DECFSZ      R13, 1, 1
	BRA         L__main7
	DECFSZ      R12, 1, 1
	BRA         L__main7
	DECFSZ      R11, 1, 1
	BRA         L__main7
;TMP007.mbas,60 :: 		if porta.3 = 0 then
	BTFSC       PORTA+0, 3 
	GOTO        L__main9
;TMP007.mbas,61 :: 		asm goto 0x30 end asm
	GOTO        48
L__main9:
;TMP007.mbas,63 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
