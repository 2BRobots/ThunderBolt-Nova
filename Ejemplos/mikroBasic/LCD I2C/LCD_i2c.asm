
_I2C_LCD_Cmd:

;LCD_i2c.mbas,32 :: 		Dim rs as byte
;LCD_i2c.mbas,34 :: 		rs = 0
	CLRF        I2C_LCD_Cmd_rs+0 
;LCD_i2c.mbas,36 :: 		hi_n = out_char and $F0
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       I2C_LCD_Cmd_hi_n+0 
;LCD_i2c.mbas,37 :: 		lo_n = (out_char << 4) and $F0
	MOVF        FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       I2C_LCD_Cmd_lo_n+0 
	RLCF        I2C_LCD_Cmd_lo_n+0, 1 
	BCF         I2C_LCD_Cmd_lo_n+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n+0, 1 
	BCF         I2C_LCD_Cmd_lo_n+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n+0, 1 
	BCF         I2C_LCD_Cmd_lo_n+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n+0, 1 
	BCF         I2C_LCD_Cmd_lo_n+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Cmd_lo_n+0, 1 
;LCD_i2c.mbas,39 :: 		I2C1_Start()
	CALL        _I2C1_Start+0, 0
;LCD_i2c.mbas,40 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,41 :: 		I2C1_Wr(LCD_ADDR)
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,42 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,43 :: 		I2C1_Wr(hi_n or rs or $04 or $08)
	MOVF        I2C_LCD_Cmd_rs+0, 0 
	IORWF       I2C_LCD_Cmd_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,44 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,45 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Cmd1:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Cmd1
	NOP
	NOP
;LCD_i2c.mbas,46 :: 		I2C1_Wr(hi_n or rs or $00 or $08)
	MOVF        I2C_LCD_Cmd_rs+0, 0 
	IORWF       I2C_LCD_Cmd_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,47 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,48 :: 		Delay_us(100)
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       141
	MOVWF       R13, 0
L__I2C_LCD_Cmd2:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Cmd2
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Cmd2
	NOP
	NOP
;LCD_i2c.mbas,49 :: 		I2C1_Wr(lo_n or rs or $04 or $08)
	MOVF        I2C_LCD_Cmd_rs+0, 0 
	IORWF       I2C_LCD_Cmd_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,50 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,51 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Cmd3:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Cmd3
	NOP
	NOP
;LCD_i2c.mbas,52 :: 		I2C1_Wr(lo_n or rs or $00 or $08)
	MOVF        I2C_LCD_Cmd_rs+0, 0 
	IORWF       I2C_LCD_Cmd_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,53 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,54 :: 		I2C1_stop()
	CALL        _I2C1_Stop+0, 0
;LCD_i2c.mbas,56 :: 		if(out_char = $01) then
	MOVF        FARG_I2C_LCD_Cmd_out_char+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Cmd5
;LCD_i2c.mbas,57 :: 		Delay_ms(2)
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L__I2C_LCD_Cmd7:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Cmd7
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Cmd7
	NOP
	NOP
L__I2C_LCD_Cmd5:
;LCD_i2c.mbas,59 :: 		end sub
L_end_I2C_LCD_Cmd:
	RETURN      0
; end of _I2C_LCD_Cmd

_I2C_LCD_Chr:

;LCD_i2c.mbas,64 :: 		Dim rs as byte
;LCD_i2c.mbas,66 :: 		rs = 1
	MOVLW       1
	MOVWF       I2C_LCD_Chr_rs+0 
;LCD_i2c.mbas,70 :: 		case 1
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Chr12
;LCD_i2c.mbas,71 :: 		I2C_LCD_Cmd($80 + (column - 1))
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       128
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
	GOTO        L__I2C_LCD_Chr9
L__I2C_LCD_Chr12:
;LCD_i2c.mbas,72 :: 		case 2
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Chr15
;LCD_i2c.mbas,73 :: 		I2C_LCD_Cmd($C0 + (column - 1))
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       192
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
	GOTO        L__I2C_LCD_Chr9
L__I2C_LCD_Chr15:
;LCD_i2c.mbas,74 :: 		case 3
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Chr18
;LCD_i2c.mbas,75 :: 		I2C_LCD_Cmd($94 + (column - 1))
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       148
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
	GOTO        L__I2C_LCD_Chr9
L__I2C_LCD_Chr18:
;LCD_i2c.mbas,76 :: 		case 4
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Chr21
;LCD_i2c.mbas,77 :: 		I2C_LCD_Cmd($D4 + (column - 1))
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       212
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
	GOTO        L__I2C_LCD_Chr9
L__I2C_LCD_Chr21:
L__I2C_LCD_Chr9:
;LCD_i2c.mbas,80 :: 		hi_n = out_char and $F0
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_hi_n+0 
;LCD_i2c.mbas,81 :: 		lo_n = (out_char << 4) and $F0
	MOVF        FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_lo_n+0 
	RLCF        I2C_LCD_Chr_lo_n+0, 1 
	BCF         I2C_LCD_Chr_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_lo_n+0, 1 
	BCF         I2C_LCD_Chr_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_lo_n+0, 1 
	BCF         I2C_LCD_Chr_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_lo_n+0, 1 
	BCF         I2C_LCD_Chr_lo_n+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Chr_lo_n+0, 1 
;LCD_i2c.mbas,83 :: 		I2C1_Start()
	CALL        _I2C1_Start+0, 0
;LCD_i2c.mbas,84 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,85 :: 		I2C1_Wr(LCD_ADDR)
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,86 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,87 :: 		I2C1_Wr(hi_n or rs or $04 or $08)
	MOVF        I2C_LCD_Chr_rs+0, 0 
	IORWF       I2C_LCD_Chr_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,88 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,89 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Chr22:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr22
	NOP
	NOP
;LCD_i2c.mbas,90 :: 		I2C1_Wr(hi_n or rs or $00 or $08)
	MOVF        I2C_LCD_Chr_rs+0, 0 
	IORWF       I2C_LCD_Chr_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,91 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,92 :: 		Delay_us(100)
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       141
	MOVWF       R13, 0
L__I2C_LCD_Chr23:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr23
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Chr23
	NOP
	NOP
;LCD_i2c.mbas,93 :: 		I2C1_Wr(lo_n or rs or $04 or $08)
	MOVF        I2C_LCD_Chr_rs+0, 0 
	IORWF       I2C_LCD_Chr_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,94 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,95 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Chr24:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr24
	NOP
	NOP
;LCD_i2c.mbas,96 :: 		I2C1_Wr(lo_n or rs or $00 or $08)
	MOVF        I2C_LCD_Chr_rs+0, 0 
	IORWF       I2C_LCD_Chr_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,97 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,98 :: 		I2C1_stop()
	CALL        _I2C1_Stop+0, 0
;LCD_i2c.mbas,99 :: 		end sub
L_end_I2C_LCD_Chr:
	RETURN      0
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;LCD_i2c.mbas,104 :: 		Dim rs as byte
;LCD_i2c.mbas,106 :: 		rs = $01
	MOVLW       1
	MOVWF       I2C_LCD_Chr_Cp_rs+0 
;LCD_i2c.mbas,108 :: 		hi_n = out_char and $F0
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_Cp_hi_n+0 
;LCD_i2c.mbas,109 :: 		lo_n = (out_char << 4) and $F0
	MOVF        FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_Cp_lo_n+0 
	RLCF        I2C_LCD_Chr_Cp_lo_n+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Chr_Cp_lo_n+0, 1 
;LCD_i2c.mbas,111 :: 		I2C1_Start()
	CALL        _I2C1_Start+0, 0
;LCD_i2c.mbas,112 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,113 :: 		I2C1_Wr(LCD_ADDR)
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,114 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,115 :: 		I2C1_Wr(hi_n or rs or $04 or $08)
	MOVF        I2C_LCD_Chr_Cp_rs+0, 0 
	IORWF       I2C_LCD_Chr_Cp_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,116 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,117 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Chr_Cp26:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr_Cp26
	NOP
	NOP
;LCD_i2c.mbas,118 :: 		I2C1_Wr(hi_n or rs or $00 or $08)
	MOVF        I2C_LCD_Chr_Cp_rs+0, 0 
	IORWF       I2C_LCD_Chr_Cp_hi_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,119 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,120 :: 		Delay_us(100)
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       141
	MOVWF       R13, 0
L__I2C_LCD_Chr_Cp27:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr_Cp27
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Chr_Cp27
	NOP
	NOP
;LCD_i2c.mbas,121 :: 		I2C1_Wr(lo_n or rs or $04 or $08)
	MOVF        I2C_LCD_Chr_Cp_rs+0, 0 
	IORWF       I2C_LCD_Chr_Cp_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,122 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,123 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Chr_Cp28:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Chr_Cp28
	NOP
	NOP
;LCD_i2c.mbas,124 :: 		I2C1_Wr(lo_n or rs or $00 or $08)
	MOVF        I2C_LCD_Chr_Cp_rs+0, 0 
	IORWF       I2C_LCD_Chr_Cp_lo_n+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,125 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,126 :: 		I2C1_stop()
	CALL        _I2C1_Stop+0, 0
;LCD_i2c.mbas,127 :: 		end sub
L_end_I2C_LCD_Chr_Cp:
	RETURN      0
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Init:

;LCD_i2c.mbas,132 :: 		Dim rs as byte
;LCD_i2c.mbas,134 :: 		I2C1_Start()
	CALL        _I2C1_Start+0, 0
;LCD_i2c.mbas,135 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,136 :: 		I2C1_Wr(LCD_ADDR)
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,137 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,139 :: 		Delay_ms(30)
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       133
	MOVWF       R13, 0
L__I2C_LCD_Init30:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init30
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Init30
	DECFSZ      R11, 1, 1
	BRA         L__I2C_LCD_Init30
;LCD_i2c.mbas,141 :: 		I2C1_Wr($30 or rs or $04 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,142 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,143 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Init31:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init31
	NOP
	NOP
;LCD_i2c.mbas,144 :: 		I2C1_Wr($30 or rs or $00 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,145 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,147 :: 		Delay_ms(10)
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L__I2C_LCD_Init32:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init32
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Init32
;LCD_i2c.mbas,149 :: 		I2C1_Wr($30 or rs or $04 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,150 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,151 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Init33:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init33
	NOP
	NOP
;LCD_i2c.mbas,152 :: 		I2C1_Wr($30 or rs or $00 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,153 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,155 :: 		Delay_ms(10)
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L__I2C_LCD_Init34:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init34
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Init34
;LCD_i2c.mbas,157 :: 		I2C1_Wr($30 or rs or $04 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,158 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,159 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Init35:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init35
	NOP
	NOP
;LCD_i2c.mbas,160 :: 		I2C1_Wr($30 or rs or $00 or $08)
	MOVLW       48
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,161 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,163 :: 		Delay_ms(10)
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L__I2C_LCD_Init36:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init36
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Init36
;LCD_i2c.mbas,165 :: 		I2C1_Wr($20 or rs or $04 or $08)
	MOVLW       32
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,166 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,167 :: 		Delay_us(50)
	MOVLW       199
	MOVWF       R13, 0
L__I2C_LCD_Init37:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init37
	NOP
	NOP
;LCD_i2c.mbas,168 :: 		I2C1_Wr($20 or rs or $00 or $08)
	MOVLW       32
	IORWF       I2C_LCD_Init_rs+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;LCD_i2c.mbas,169 :: 		I2C1_Is_Idle()
	CALL        _I2C1_Is_Idle+0, 0
;LCD_i2c.mbas,170 :: 		I2C1_Stop()
	CALL        _I2C1_Stop+0, 0
;LCD_i2c.mbas,172 :: 		Delay_ms(10)
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L__I2C_LCD_Init38:
	DECFSZ      R13, 1, 1
	BRA         L__I2C_LCD_Init38
	DECFSZ      R12, 1, 1
	BRA         L__I2C_LCD_Init38
;LCD_i2c.mbas,174 :: 		I2C_LCD_Cmd($28)
	MOVLW       40
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;LCD_i2c.mbas,175 :: 		I2C_LCD_Cmd($06)
	MOVLW       6
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;LCD_i2c.mbas,176 :: 		end sub
L_end_I2C_LCD_Init:
	RETURN      0
; end of _I2C_LCD_Init

_I2C_LCD_Out:

;LCD_i2c.mbas,179 :: 		Dim i as byte
;LCD_i2c.mbas,181 :: 		for i = 0 to Strlen(text) - 1
	CLRF        I2C_LCD_Out_i+0 
L__I2C_LCD_Out40:
	MOVF        FARG_I2C_LCD_Out_text+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_I2C_LCD_Out_text+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       FLOC__I2C_LCD_Out+0 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       FLOC__I2C_LCD_Out+1 
	MOVLW       0
	SUBWF       FLOC__I2C_LCD_Out+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out62
	MOVF        I2C_LCD_Out_i+0, 0 
	SUBWF       FLOC__I2C_LCD_Out+0, 0 
L__I2C_LCD_Out62:
	BTFSS       STATUS+0, 0 
	GOTO        L__I2C_LCD_Out44
;LCD_i2c.mbas,182 :: 		I2C_LCD_Chr(row, column, text[i])
	MOVF        FARG_I2C_LCD_Out_row+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_row+0 
	MOVF        FARG_I2C_LCD_Out_column+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_column+0 
	MOVF        I2C_LCD_Out_i+0, 0 
	ADDWF       FARG_I2C_LCD_Out_text+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_I2C_LCD_Out_text+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_out_char+0 
	CALL        _I2C_LCD_Chr+0, 0
;LCD_i2c.mbas,183 :: 		column = column + 1
	INCF        FARG_I2C_LCD_Out_column+0, 1 
;LCD_i2c.mbas,184 :: 		next i
	MOVLW       0
	XORWF       FLOC__I2C_LCD_Out+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out63
	MOVF        FLOC__I2C_LCD_Out+0, 0 
	XORWF       I2C_LCD_Out_i+0, 0 
L__I2C_LCD_Out63:
	BTFSC       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out44
	INCF        I2C_LCD_Out_i+0, 1 
	GOTO        L__I2C_LCD_Out40
L__I2C_LCD_Out44:
;LCD_i2c.mbas,185 :: 		end sub
L_end_I2C_LCD_Out:
	RETURN      0
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;LCD_i2c.mbas,188 :: 		Dim i as byte
;LCD_i2c.mbas,190 :: 		for i = 0 to Strlen(text) - 1
	CLRF        I2C_LCD_Out_Cp_i+0 
L__I2C_LCD_Out_Cp46:
	MOVF        FARG_I2C_LCD_Out_Cp_text+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_I2C_LCD_Out_Cp_text+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       FLOC__I2C_LCD_Out_Cp+0 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       FLOC__I2C_LCD_Out_Cp+1 
	MOVLW       0
	SUBWF       FLOC__I2C_LCD_Out_Cp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out_Cp65
	MOVF        I2C_LCD_Out_Cp_i+0, 0 
	SUBWF       FLOC__I2C_LCD_Out_Cp+0, 0 
L__I2C_LCD_Out_Cp65:
	BTFSS       STATUS+0, 0 
	GOTO        L__I2C_LCD_Out_Cp50
;LCD_i2c.mbas,191 :: 		I2C_LCD_Chr_Cp(text[i])
	MOVF        I2C_LCD_Out_Cp_i+0, 0 
	ADDWF       FARG_I2C_LCD_Out_Cp_text+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_I2C_LCD_Out_Cp_text+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_Cp_out_char+0 
	CALL        _I2C_LCD_Chr_Cp+0, 0
;LCD_i2c.mbas,192 :: 		next i
	MOVLW       0
	XORWF       FLOC__I2C_LCD_Out_Cp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out_Cp66
	MOVF        FLOC__I2C_LCD_Out_Cp+0, 0 
	XORWF       I2C_LCD_Out_Cp_i+0, 0 
L__I2C_LCD_Out_Cp66:
	BTFSC       STATUS+0, 2 
	GOTO        L__I2C_LCD_Out_Cp50
	INCF        I2C_LCD_Out_Cp_i+0, 1 
	GOTO        L__I2C_LCD_Out_Cp46
L__I2C_LCD_Out_Cp50:
;LCD_i2c.mbas,193 :: 		end sub
L_end_I2C_LCD_Out_Cp:
	RETURN      0
; end of _I2C_LCD_Out_Cp

_main:

;LCD_i2c.mbas,197 :: 		org 0x1000
;LCD_i2c.mbas,200 :: 		txt1 = "I2C LCD EXAMPLE"
	MOVLW       73
	MOVWF       _txt1+0 
	MOVLW       50
	MOVWF       _txt1+1 
	MOVLW       67
	MOVWF       _txt1+2 
	MOVLW       32
	MOVWF       _txt1+3 
	MOVLW       76
	MOVWF       _txt1+4 
	MOVLW       67
	MOVWF       _txt1+5 
	MOVLW       68
	MOVWF       _txt1+6 
	MOVLW       32
	MOVWF       _txt1+7 
	MOVLW       69
	MOVWF       _txt1+8 
	MOVLW       88
	MOVWF       _txt1+9 
	MOVLW       65
	MOVWF       _txt1+10 
	MOVLW       77
	MOVWF       _txt1+11 
	MOVLW       80
	MOVWF       _txt1+12 
	MOVLW       76
	MOVWF       _txt1+13 
	MOVLW       69
	MOVWF       _txt1+14 
	CLRF        _txt1+15 
;LCD_i2c.mbas,201 :: 		txt2 = "Hola mundo! :)"
	MOVLW       72
	MOVWF       _txt2+0 
	MOVLW       111
	MOVWF       _txt2+1 
	MOVLW       108
	MOVWF       _txt2+2 
	MOVLW       97
	MOVWF       _txt2+3 
	MOVLW       32
	MOVWF       _txt2+4 
	MOVLW       109
	MOVWF       _txt2+5 
	MOVLW       117
	MOVWF       _txt2+6 
	MOVLW       110
	MOVWF       _txt2+7 
	MOVLW       100
	MOVWF       _txt2+8 
	MOVLW       111
	MOVWF       _txt2+9 
	MOVLW       33
	MOVWF       _txt2+10 
	MOVLW       32
	MOVWF       _txt2+11 
	MOVLW       58
	MOVWF       _txt2+12 
	MOVLW       41
	MOVWF       _txt2+13 
	CLRF        _txt2+14 
;LCD_i2c.mbas,203 :: 		I2C1_Init(100000)
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;LCD_i2c.mbas,205 :: 		I2C_LCD_Init()
	CALL        _I2C_LCD_Init+0, 0
;LCD_i2c.mbas,206 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF)
	MOVLW       12
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;LCD_i2c.mbas,207 :: 		I2C_LCD_Cmd(_LCD_CLEAR)
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;LCD_i2c.mbas,208 :: 		I2C_Lcd_Out(1,1,txt1)                 ' Write text in first row
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;LCD_i2c.mbas,209 :: 		I2C_Lcd_Out(2,1,txt2)                 ' Write text in second row
	MOVLW       2
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;LCD_i2c.mbas,211 :: 		while(TRUE)
L__main53:
	GOTO        L__main53
;LCD_i2c.mbas,213 :: 		Wend
L_end_main:
	GOTO        $+0
; end of _main
