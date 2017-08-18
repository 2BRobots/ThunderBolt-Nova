
_servo:

	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_servo_angulo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo13
	MOVF        FARG_servo_angulo+0, 0 
	SUBLW       0
L__servo13:
	BTFSS       STATUS+0, 0 
	GOTO        L_servo0
	CLRF        FARG_servo_angulo+0 
	CLRF        FARG_servo_angulo+1 
L_servo0:
	MOVLW       128
	XORWF       FARG_servo_angulo+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo14
	MOVLW       180
	SUBWF       FARG_servo_angulo+0, 0 
L__servo14:
	BTFSS       STATUS+0, 0 
	GOTO        L_servo1
	MOVLW       180
	MOVWF       FARG_servo_angulo+0 
	MOVLW       0
	MOVWF       FARG_servo_angulo+1 
L_servo1:
	BSF         LATC+0, 5 
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_servo2:
	DECFSZ      R13, 1, 1
	BRA         L_servo2
	DECFSZ      R12, 1, 1
	BRA         L_servo2
	NOP
	CLRF        R1 
	CLRF        R2 
L_servo3:
	MOVLW       128
	XORWF       FARG_servo_angulo+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__servo15
	MOVF        R1, 0 
	SUBWF       FARG_servo_angulo+0, 0 
L__servo15:
	BTFSS       STATUS+0, 0 
	GOTO        L_servo4
	MOVLW       23
	MOVWF       R13, 0
L_servo6:
	DECFSZ      R13, 1, 1
	BRA         L_servo6
	NOP
	NOP
	INFSNZ      R1, 1 
	INCF        R2, 1 
	GOTO        L_servo3
L_servo4:
	BCF         LATC+0, 5 
L_end_servo:
	RETURN      0
; end of _servo

_ADC_Read:

	MOVF        FARG_ADC_Read_Chan_Sel+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       ADCON0+0 
	BSF         ADCON0+0, 1 
L_ADC_Read7:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADC_Read8
	NOP
	GOTO        L_ADC_Read7
L_ADC_Read8:
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
L_end_ADC_Read:
	RETURN      0
; end of _ADC_Read

_main:

	BCF         TRISC+0, 5 
	BSF         TRISB+0, 5 
	BCF         ANSELH+0, 3 
L_main9:
	MOVLW       11
	MOVWF       FARG_ADC_Read_Chan_Sel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
	MOVLW       180
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       255
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
	MOVF        R0, 0 
	MOVWF       FARG_servo_angulo+0 
	MOVF        R1, 0 
	MOVWF       FARG_servo_angulo+1 
	CALL        _servo+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	GOTO        L_main9
L_end_main:
	GOTO        $+0
; end of _main
