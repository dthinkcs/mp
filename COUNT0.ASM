CODE SEGMENT
	ASSUME CS:CODE
START:
	MOV BL, 0F3H;
	CALL DISP_HEX_BL;  DL, CL, AH CHANGES
	
	
	
	CALL DELAY
	
	
	MOV DL, 13; // /r
	CALL DISP_CHAR_DL; FIRST CHANGE DL

	
	ADD BL, 01H;
	CALL DISP_HEX_BL;
	
	
	
	
	
	
	
	
	
	
	MOV AH, 4CH
	INT 21H
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
DELAY:
	MOV SI, 0FFH
	BACK1:
		MOV DI, 0FFFH;
		BACK2:
			DEC DI
			JNZ BACK2
		DEC SI
		JNZ BACK1
	RET
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
DISP_CHAR_DL:
	
	MOV AH, 02H
	INT 21H
	
	RET 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
DISP_HEX_BL:	
	MOV DL, BL
	MOV CL, 04H
	SHR DL, CL;
	CALL HEX_ASCII
	CALL DISP
	
		
	MOV DL, 00FH;
	AND DL, BL;
	CALL HEX_ASCII
	CALL DISP

	RET

	
HEX_ASCII:
	CMP DL, 0AH
	JC ADD30
	ADD DL, 07H
	ADD30:	ADD DL, 30H
	RET
DISP:
	MOV AH, 02
	INT 21H
	RET

	
CODE ENDS
END START