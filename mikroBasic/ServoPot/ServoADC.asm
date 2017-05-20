
_servo:

;ServoADC.mbas,7 :: 		dim i as byte
;ServoADC.mbas,8 :: 		if angulo <= 0 then
	MOVLW       0
	MOVWF       R0 
	MOVF        FARG_servo_angulo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo21
	MOVF        FARG_servo_angulo+0, 0 
	SUBLW       0
L__servo21:
	BTFSS       STATUS+0, 0 
	GOTO        L__servo2
;ServoADC.mbas,9 :: 		angulo = 0
	CLRF        FARG_servo_angulo+0 
	CLRF        FARG_servo_angulo+1 
L__servo2:
;ServoADC.mbas,12 :: 		if angulo >= 180 then
	MOVLW       0
	SUBWF       FARG_servo_angulo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo22
	MOVLW       180
	SUBWF       FARG_servo_angulo+0, 0 
L__servo22:
	BTFSS       STATUS+0, 0 
	GOTO        L__servo5
;ServoADC.mbas,13 :: 		angulo = 180
	MOVLW       180
	MOVWF       FARG_servo_angulo+0 
	MOVLW       0
	MOVWF       FARG_servo_angulo+1 
L__servo5:
;ServoADC.mbas,16 :: 		ServoPin = 1
	BSF         LATC+0, 5 
;ServoADC.mbas,18 :: 		delay_us(600)
	MOVLW       10
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L__servo7:
	DECFSZ      R13, 1, 1
	BRA         L__servo7
	DECFSZ      R12, 1, 1
	BRA         L__servo7
	NOP
;ServoADC.mbas,20 :: 		for i = 0 to angulo step 1
	CLRF        R1 
L__servo8:
	MOVLW       0
	SUBWF       FARG_servo_angulo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo23
	MOVF        R1, 0 
	SUBWF       FARG_servo_angulo+0, 0 
L__servo23:
	BTFSS       STATUS+0, 0 
	GOTO        L__servo12
;ServoADC.mbas,21 :: 		delay_us(8)
	MOVLW       31
	MOVWF       R13, 0
L__servo13:
	DECFSZ      R13, 1, 1
	BRA         L__servo13
	NOP
	NOP
;ServoADC.mbas,22 :: 		next i
	MOVLW       0
	XORWF       FARG_servo_angulo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo24
	MOVF        FARG_servo_angulo+0, 0 
	XORWF       R1, 0 
L__servo24:
	BTFSC       STATUS+0, 2 
	GOTO        L__servo12
	INCF        R1, 1 
	GOTO        L__servo8
L__servo12:
;ServoADC.mbas,24 :: 		ServoPin = 0
	BCF         LATC+0, 5 
;ServoADC.mbas,26 :: 		end sub
L_end_servo:
	RETURN      0
; end of _servo

_main:

;ServoADC.mbas,31 :: 		org 0x1000
;ServoADC.mbas,34 :: 		TRISB.4 = 1
	BSF         TRISB+0, 4 
;ServoADC.mbas,35 :: 		TRISC.5 = 0
	BCF         TRISC+0, 5 
;ServoADC.mbas,36 :: 		ADC_Init_Advanced(_ADC_INTERNAL_REF)
	CLRF        FARG_ADC_Init_Advanced_reference+0 
	CALL        _ADC_Init_Advanced+0, 0
;ServoADC.mbas,38 :: 		loop:
L__main_loop:
;ServoADC.mbas,39 :: 		x = ADC_Get_Sample(10)
	MOVLW       10
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;ServoADC.mbas,40 :: 		x = x>>2
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	MOVF        R2, 0 
	MOVWF       _x+0 
	MOVF        R3, 0 
	MOVWF       _x+1 
;ServoADC.mbas,41 :: 		servo(x)
	MOVF        R2, 0 
	MOVWF       FARG_servo_angulo+0 
	MOVF        R3, 0 
	MOVWF       FARG_servo_angulo+1 
	CALL        _servo+0, 0
;ServoADC.mbas,42 :: 		delay_ms(20)
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main16:
	DECFSZ      R13, 1, 1
	BRA         L__main16
	DECFSZ      R12, 1, 1
	BRA         L__main16
	DECFSZ      R11, 1, 1
	BRA         L__main16
;ServoADC.mbas,44 :: 		if porta.3 = 0 then
	BTFSC       PORTA+0, 3 
	GOTO        L__main18
;ServoADC.mbas,45 :: 		asm goto 0x30 end asm
	GOTO        48
L__main18:
;ServoADC.mbas,48 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
