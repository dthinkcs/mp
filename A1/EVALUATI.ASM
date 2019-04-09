DATA SEGMENT
        A DB 5 DUP(?)
        ODD  DB 0
        EVE DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,0H
        MOV CX,05H
        MOV AX,0H
        MOV BL,02H

     BACK:
           MOV AL,A[SI]
           DIV BL
           CMP AH,0H
           JZ TEMP
           ADD ODD,01H
           JMP LAB
         TEMP:
           ADD EVE,01H

         LAB:
           MOV AX,0H
           ADD SI,0
           LOOP BACK

        MOV AH,4CH
        INT 21H

     CODE ENDS
END START
