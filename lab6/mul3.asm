
CODE SEGMENT 
	ASSUME CS: CODE;
START:
	MOV AL, 11H;
	MOV BX, 0FFFFH;
	
	MUL BX; // only change
	
	
	MOV AH, 4CH;
	INT 21H;
CODE ENDS
END START
