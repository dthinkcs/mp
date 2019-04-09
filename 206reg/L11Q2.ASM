Data Segment
	msg DB 'HELLO$'
	col DB 40	;row and column value for printing in the centre
    row DB 12
Data Ends

Code Segment
	Assume CS:Code, DS:Data
Start:	MOV AX, Data
		MOV DS, AX


CHK:	CALL REFRESH

 		MOV DL, 0FFH
		MOV AH, 06H		;direct IO input interrupt
		INT 21H
                CMP AL, 'r'
		JZ inY
                CMP AL, 'l'
		JZ deY
                CMP AL, 'd'
		JZ inX
                CMP AL, 'u'
		JZ deX
		CMP AL, 't'
		JNZ CHK
		MOV AH, 4CH
		INT 21H

inY:    INC col 		;increments column 
        CALL REFS
        JMP CHK
deY:    DEC col 		;decrements, moves left
        CALL REFS
        JMP CHK
inX:    INC row 		;increments row value, moves up
        CALL REFS
        JMP CHK
deX:    DEC row			;moves down
        CALL REFS
        JMP CHK

REFRESH PROC 			;procedure to print entire string in specified row and column value
		MOV DL, 00H
		LEA DI, msg
		MOV CL, col

UP:             MOV BL, row
                MOV DH, [DI]
		PUSH DS
		MOV AX, 0B800H
		MOV DS, AX

               
		MOV Al, 160		
		MUL BL
		MOV BX, AX
		MOV AL, 2
		MUL CL
		ADD AX, BX
		MOV SI, AX
		MOV [SI], DH
                MOV BYTE PTR[SI+1], 74H
		INC DI
		INC CL
		POP DS
		INC DL
		CMP DL, 05
		JNZ UP
		RET
REFRESH ENDP

REFS PROC				;procedure to refresh screen
        MOV AH, 0               ;sets screen in text mode
        MOV AL, 3               ;sets size to 80*25
        INT 10H
        RET
REFS ENDP

Code Ends
End Start
