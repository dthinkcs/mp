DATA SEGMENT
	M1 DB "ENTER CHARACHTER$"
	M3 DB 10,8,"$"
	M2 DB "DISPLAY$"
	M4 DB "$"
DATA ENDS

PRINT MACRO MSG
	LEA DX,MSG
	MOV AH,04
	INT 21H
ENDM

CODE SEGMENT
ASSUME CS:CODE , DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        XOR AX,AX
        PRINT M1
	CALL ENTER
        PRINT M3
	PRINT M2
	MOV DL,AL
	MOV AH,02
	INT 21H

MOV AH,4CH
INT 21H
ENTER PROC 
     BACK:   MOV AH,01
             INT 21H
       RET  
	ENTER ENDP     
CODE ENDS
END START