
_interrupt:

;Timer_interrupt.mbas,5 :: 		org 0x1008
;Timer_interrupt.mbas,6 :: 		if INTCON.0 = 1 then
	BTFSS       INTCON+0, 0 
	GOTO        L__interrupt2
;Timer_interrupt.mbas,7 :: 		LATB.7 = not PORTB.7
	BTFSC       PORTB+0, 7 
	GOTO        L__interrupt9
	BSF         LATB+0, 7 
	GOTO        L__interrupt10
L__interrupt9:
	BCF         LATB+0, 7 
L__interrupt10:
;Timer_interrupt.mbas,8 :: 		INTCON.0 = 0
	BCF         INTCON+0, 0 
L__interrupt2:
;Timer_interrupt.mbas,10 :: 		end sub
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_main:

;Timer_interrupt.mbas,13 :: 		org 0x102A
;Timer_interrupt.mbas,14 :: 		INTCON = %11001000
	MOVLW       200
	MOVWF       INTCON+0 
;Timer_interrupt.mbas,15 :: 		IOCA.3 = 1
	BSF         IOCA+0, 3 
;Timer_interrupt.mbas,16 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;Timer_interrupt.mbas,17 :: 		LATB.7 = 0
	BCF         LATB+0, 7 
;Timer_interrupt.mbas,18 :: 		delay_ms(500)
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L__main5:
	DECFSZ      R13, 1, 1
	BRA         L__main5
	DECFSZ      R12, 1, 1
	BRA         L__main5
	DECFSZ      R11, 1, 1
	BRA         L__main5
	NOP
;Timer_interrupt.mbas,19 :: 		LATB.7 = 1
	BSF         LATB+0, 7 
;Timer_interrupt.mbas,20 :: 		delay_ms(500)
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L__main6:
	DECFSZ      R13, 1, 1
	BRA         L__main6
	DECFSZ      R12, 1, 1
	BRA         L__main6
	DECFSZ      R11, 1, 1
	BRA         L__main6
	NOP
;Timer_interrupt.mbas,21 :: 		LATB.7 = 0
	BCF         LATB+0, 7 
L_end_main:
	GOTO        $+0
; end of _main
