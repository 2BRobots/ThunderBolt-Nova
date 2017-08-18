
_servo:

;Servo.mbas,7 :: 		sub procedure servo (dim x as byte)
;Servo.mbas,8 :: 		portc.5 = 1
	BSF         PORTC+0, 5 
;Servo.mbas,9 :: 		delay_us (600)
	MOVLW       10
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L__servo1:
	DECFSZ      R13, 1, 1
	BRA         L__servo1
	DECFSZ      R12, 1, 1
	BRA         L__servo1
	NOP
;Servo.mbas,10 :: 		for i = 0 to x step 1
	CLRF        _i+0 
L__servo2:
	MOVF        _i+0, 0 
	SUBWF       FARG_servo_x+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__servo6
;Servo.mbas,11 :: 		delay_us (9)
	MOVLW       35
	MOVWF       R13, 0
L__servo7:
	DECFSZ      R13, 1, 1
	BRA         L__servo7
	NOP
	NOP
;Servo.mbas,12 :: 		next i
	MOVF        _i+0, 0 
	XORWF       FARG_servo_x+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__servo6
	INCF        _i+0, 1 
	GOTO        L__servo2
L__servo6:
;Servo.mbas,13 :: 		portc.5 = 0
	BCF         PORTC+0, 5 
;Servo.mbas,14 :: 		end sub
L_end_servo:
	RETURN      0
; end of _servo

_main:

;Servo.mbas,20 :: 		org 0x1000
;Servo.mbas,23 :: 		trisc.5 = 0
	BCF         TRISC+0, 5 
;Servo.mbas,24 :: 		loop:
L__main_loop:
;Servo.mbas,25 :: 		for va = 0 to 180 step 5
	CLRF        _va+0 
L__main10:
	MOVF        _va+0, 0 
	SUBLW       180
	BTFSS       STATUS+0, 0 
	GOTO        L__main14
;Servo.mbas,26 :: 		servo(va)
	MOVF        _va+0, 0 
	MOVWF       FARG_servo_x+0 
	CALL        _servo+0, 0
;Servo.mbas,27 :: 		delay_ms(20)
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main15:
	DECFSZ      R13, 1, 1
	BRA         L__main15
	DECFSZ      R12, 1, 1
	BRA         L__main15
	DECFSZ      R11, 1, 1
	BRA         L__main15
;Servo.mbas,28 :: 		next va
	MOVF        _va+0, 0 
	XORLW       180
	BTFSC       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       5
	ADDWF       _va+0, 1 
	GOTO        L__main10
L__main14:
;Servo.mbas,30 :: 		for va = 180 to 0 step -1
	MOVLW       180
	MOVWF       _va+0 
L__main17:
;Servo.mbas,31 :: 		servo(va)
	MOVF        _va+0, 0 
	MOVWF       FARG_servo_x+0 
	CALL        _servo+0, 0
;Servo.mbas,32 :: 		delay_ms(20)
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main21:
	DECFSZ      R13, 1, 1
	BRA         L__main21
	DECFSZ      R12, 1, 1
	BRA         L__main21
	DECFSZ      R11, 1, 1
	BRA         L__main21
;Servo.mbas,33 :: 		next va
	MOVF        _va+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       255
	ADDWF       _va+0, 1 
	GOTO        L__main17
L__main20:
;Servo.mbas,34 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
