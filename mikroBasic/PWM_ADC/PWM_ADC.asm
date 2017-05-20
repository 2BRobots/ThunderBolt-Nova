
_main:

;PWM_ADC.mbas,7 :: 		org 0x1000
;PWM_ADC.mbas,10 :: 		TRISB.4 = 1
	BSF         TRISB+0, 4 
;PWM_ADC.mbas,11 :: 		TRISC.5 = 0
	BCF         TRISC+0, 5 
;PWM_ADC.mbas,12 :: 		ADC_Init_Advanced(_ADC_INTERNAL_REF)
	CLRF        FARG_ADC_Init_Advanced_reference+0 
	CALL        _ADC_Init_Advanced+0, 0
;PWM_ADC.mbas,13 :: 		PWM1_Init(5000)
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       149
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PWM_ADC.mbas,14 :: 		PWM1_Start()
	CALL        _PWM1_Start+0, 0
;PWM_ADC.mbas,16 :: 		loop:
L__main_loop:
;PWM_ADC.mbas,17 :: 		x = ADC_Get_Sample(10)
	MOVLW       10
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;PWM_ADC.mbas,18 :: 		x = x>>2
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
;PWM_ADC.mbas,19 :: 		PWM1_Set_Duty(x)
	MOVF        R2, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM_ADC.mbas,20 :: 		delay_ms(20)
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main2:
	DECFSZ      R13, 1, 1
	BRA         L__main2
	DECFSZ      R12, 1, 1
	BRA         L__main2
	DECFSZ      R11, 1, 1
	BRA         L__main2
;PWM_ADC.mbas,22 :: 		if porta.3 = 0 then
	BTFSC       PORTA+0, 3 
	GOTO        L__main4
;PWM_ADC.mbas,23 :: 		asm goto 0x30 end asm
	GOTO        48
L__main4:
;PWM_ADC.mbas,26 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
