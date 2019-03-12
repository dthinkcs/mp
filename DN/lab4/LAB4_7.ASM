DATA SEGMENT
        Q DB ?
        R DB ?
        A DW -5
        B DB 2
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
	MOV DX, DATA
	MOV DS, DX
       
        MOV AX, A

        MOV BL, B
        IDIV BL
        MOV Q, AL
        MOV R, AH
	
	MOV AH, 4CH
	INT 21H

CODE ENDS
END START
