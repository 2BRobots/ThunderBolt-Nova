
_main:

;blink.mbas,6 :: 		org 0x1000
;blink.mbas,10 :: 		TRISB = %00000000
	CLRF        TRISB+0 
;blink.mbas,11 :: 		TRISC = %00000000
	CLRF        TRISC+0 
;blink.mbas,15 :: 		loop:
L__main_loop:
;blink.mbas,20 :: 		latc.3 = 1
	BSF         LATC+0, 3 
;blink.mbas,21 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,22 :: 		latc.6 = 1
	BSF         LATC+0, 6 
;blink.mbas,23 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,24 :: 		latc.7 = 1
	BSF         LATC+0, 7 
;blink.mbas,25 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,26 :: 		latb.7 = 1
	BSF         LATB+0, 7 
;blink.mbas,27 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,28 :: 		latb.5 = 1
	BSF         LATB+0, 5 
;blink.mbas,29 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,30 :: 		latb.6 = 1
	BSF         LATB+0, 6 
;blink.mbas,31 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,32 :: 		latb.4 = 1
	BSF         LATB+0, 4 
;blink.mbas,33 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,34 :: 		latc.5 = 1
	BSF         LATC+0, 5 
;blink.mbas,35 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,36 :: 		latc.4 = 1
	BSF         LATC+0, 4 
;blink.mbas,37 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,38 :: 		latc.2 = 1
	BSF         LATC+0, 2 
;blink.mbas,39 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,40 :: 		latc.1 = 1
	BSF         LATC+0, 1 
;blink.mbas,41 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,42 :: 		latc.0 = 1
	BSF         LATC+0, 0 
;blink.mbas,43 :: 		gosub wait
	CALL        L__main_wait, 0
;blink.mbas,44 :: 		goto loop
	GOTO        L__main_loop
;blink.mbas,46 :: 		wait:
L__main_wait:
;blink.mbas,51 :: 		delay_ms(500)
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L__main3:
	DECFSZ      R13, 1, 1
	BRA         L__main3
	DECFSZ      R12, 1, 1
	BRA         L__main3
	DECFSZ      R11, 1, 1
	BRA         L__main3
	NOP
;blink.mbas,52 :: 		latc = %00000000
	CLRF        LATC+0 
;blink.mbas,53 :: 		latb = %00000000
	CLRF        LATB+0 
;blink.mbas,54 :: 		delay_ms(500)
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L__main4:
	DECFSZ      R13, 1, 1
	BRA         L__main4
	DECFSZ      R12, 1, 1
	BRA         L__main4
	DECFSZ      R11, 1, 1
	BRA         L__main4
	NOP
;blink.mbas,56 :: 		return
	RETURN      0
L_end_main:
	GOTO        $+0
; end of _main
