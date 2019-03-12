DATA SEGMENT
        Q DW ?
        R DW ?
        A DD -1212H
        B DW 0ABH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
	MOV DX, DATA
	MOV DS, DX

        MOV SI, 0
        MOV AX, WORD PTR A[SI]
        INC SI
        INC SI
        MOV DX, WORD PTR A[SI]

        MOV BX, B
        IDIV BX
        MOV Q, AX
        MOV R, DX
	
	MOV AH, 4CH
	INT 21H

CODE ENDS
END START
