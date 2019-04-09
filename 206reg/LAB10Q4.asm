DATA SEGMENT
	N1 dB 23
	N2 dB 88
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE
	START: MOV BH, N1
	BACK: ; Extract MS digit of count
		MOV BL,BH
		AND BL,0F0H
		; Convert to decimal value
		MOV CL,4
		ROR BL,CL
		ADD BL,30H
		MOV DL,BL
		CALL DISP
		
		; Extract the LS digit and convert to decimal value
		MOV BL,BH
		AND BL,0FH
		ADD BL,30H
		MOV DL,BL
		CALL DISP
		MOV AL,BH
		ADD AL, 01H
		DAA
		MOV BH,AL
		
		; Provide delay to display the next count value
		CALL DELAY
		; Set the cursor to starting location of the same line
		MOV DL,13
		CALL DISP
		MOV DL,0FFH

	UPP: JMP BACK
	DOWN: CMP AL,13
		JNZ BACK
		MOV AH,4CH
		INT 21H

; Procedure to display the value
DISP PROC
	MOV AH,02
	INT 21H
	RET
DISP ENDP

; Delay function
DELAY PROC
MOV	CX, 0FH
MOV	DX, 4240H
MOV	AH, 86H
INT	15H
RET
DELAY ENDP

CODE ENDS
END START