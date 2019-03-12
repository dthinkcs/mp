DATA SEGMENT
	PRODUCT DD ?
	A DW 0A15H
        B DW 0FFH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
	MOV DX, DATA
	MOV DS, DX
	
        MOV CX, B
        CLC
        MOV AX, 0
        MOV DX, 0
        BACK:
                ADD AX, A
                ADC DX, 0
                LOOP BACK
	
	MOV SI, 0
        MOV WORD PTR PRODUCT[SI], AX
	INC SI
        INC SI
        MOV WORD PTR PRODUCT[SI], DX
	
	MOV AH, 4CH
	INT 21H

CODE ENDS
END START
