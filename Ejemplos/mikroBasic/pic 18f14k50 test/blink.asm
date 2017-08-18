
_main:

;blink.mbas,6 :: 		org 0x1000
;blink.mbas,9 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;blink.mbas,13 :: 		loop:
L__main_loop:
;blink.mbas,14 :: 		PORTB.7 = 1
	BSF         PORTB+0, 7 
;blink.mbas,15 :: 		delay_ms(1000)
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L__main2:
	DECFSZ      R13, 1, 1
	BRA         L__main2
	DECFSZ      R12, 1, 1
	BRA         L__main2
	DECFSZ      R11, 1, 1
	BRA         L__main2
	NOP
	NOP
;blink.mbas,16 :: 		PORTB.7 = 0
	BCF         PORTB+0, 7 
;blink.mbas,17 :: 		delay_ms(1000)
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L__main3:
	DECFSZ      R13, 1, 1
	BRA         L__main3
	DECFSZ      R12, 1, 1
	BRA         L__main3
	DECFSZ      R11, 1, 1
	BRA         L__main3
	NOP
	NOP
;blink.mbas,19 :: 		if porta.3 = 0 then
	BTFSC       PORTA+0, 3 
	GOTO        L__main5
;blink.mbas,20 :: 		asm goto 0x30 end asm
	GOTO        48
L__main5:
;blink.mbas,22 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
