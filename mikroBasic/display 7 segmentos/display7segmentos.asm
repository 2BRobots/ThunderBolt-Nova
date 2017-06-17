
_display:

;display7segmentos.mbas,4 :: 		sub procedure display(dim num as char)
;display7segmentos.mbas,6 :: 		case "0"
	MOVF        FARG_display_num+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L__display4
;display7segmentos.mbas,7 :: 		latc = %00111111
	MOVLW       63
	MOVWF       LATC+0 
	GOTO        L__display1
L__display4:
;display7segmentos.mbas,8 :: 		case "1"
	MOVF        FARG_display_num+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L__display7
;display7segmentos.mbas,9 :: 		latc = %00000110
	MOVLW       6
	MOVWF       LATC+0 
	GOTO        L__display1
L__display7:
;display7segmentos.mbas,10 :: 		case "2"
	MOVF        FARG_display_num+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L__display10
;display7segmentos.mbas,11 :: 		latc = %01011011
	MOVLW       91
	MOVWF       LATC+0 
	GOTO        L__display1
L__display10:
;display7segmentos.mbas,12 :: 		case "3"
	MOVF        FARG_display_num+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L__display13
;display7segmentos.mbas,13 :: 		latc = %01001111
	MOVLW       79
	MOVWF       LATC+0 
	GOTO        L__display1
L__display13:
;display7segmentos.mbas,14 :: 		case "4"
	MOVF        FARG_display_num+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L__display16
;display7segmentos.mbas,15 :: 		latc = %01100110
	MOVLW       102
	MOVWF       LATC+0 
	GOTO        L__display1
L__display16:
;display7segmentos.mbas,16 :: 		case "5"
	MOVF        FARG_display_num+0, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L__display19
;display7segmentos.mbas,17 :: 		latc = %01101101
	MOVLW       109
	MOVWF       LATC+0 
	GOTO        L__display1
L__display19:
;display7segmentos.mbas,18 :: 		case "6"
	MOVF        FARG_display_num+0, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L__display22
;display7segmentos.mbas,19 :: 		latc = %01111101
	MOVLW       125
	MOVWF       LATC+0 
	GOTO        L__display1
L__display22:
;display7segmentos.mbas,20 :: 		case "7"
	MOVF        FARG_display_num+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L__display25
;display7segmentos.mbas,21 :: 		latc = %00000111
	MOVLW       7
	MOVWF       LATC+0 
	GOTO        L__display1
L__display25:
;display7segmentos.mbas,22 :: 		case "8"
	MOVF        FARG_display_num+0, 0 
	XORLW       56
	BTFSS       STATUS+0, 2 
	GOTO        L__display28
;display7segmentos.mbas,23 :: 		latc = %01111111
	MOVLW       127
	MOVWF       LATC+0 
	GOTO        L__display1
L__display28:
;display7segmentos.mbas,24 :: 		case "9"
	MOVF        FARG_display_num+0, 0 
	XORLW       57
	BTFSS       STATUS+0, 2 
	GOTO        L__display31
;display7segmentos.mbas,25 :: 		latc = %01101111
	MOVLW       111
	MOVWF       LATC+0 
	GOTO        L__display1
L__display31:
L__display1:
;display7segmentos.mbas,27 :: 		end sub
L_end_display:
	RETURN      0
; end of _display

_main:

;display7segmentos.mbas,30 :: 		org 0x1000
;display7segmentos.mbas,32 :: 		UART1_init(9600)
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;display7segmentos.mbas,33 :: 		anselh.3 = 0
	BCF         ANSELH+0, 3 
;display7segmentos.mbas,34 :: 		TRISB.5 = 1
	BSF         TRISB+0, 5 
;display7segmentos.mbas,35 :: 		TRISB.7 = 0
	BCF         TRISB+0, 7 
;display7segmentos.mbas,36 :: 		TRISC = %00000000
	CLRF        TRISC+0 
;display7segmentos.mbas,37 :: 		LATC = %00000000
	CLRF        LATC+0 
;display7segmentos.mbas,38 :: 		loop:
L__main_loop:
;display7segmentos.mbas,39 :: 		if (UART1_data_ready() <> 0) then
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main35
;display7segmentos.mbas,40 :: 		i = UART1_read()
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _i+0 
;display7segmentos.mbas,41 :: 		display(i)
	MOVF        R0, 0 
	MOVWF       FARG_display_num+0 
	CALL        _display+0, 0
L__main35:
;display7segmentos.mbas,43 :: 		goto loop
	GOTO        L__main_loop
L_end_main:
	GOTO        $+0
; end of _main
