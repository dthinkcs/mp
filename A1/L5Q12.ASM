DATA SEGMENT
        HEX DW ?
        BCD DD ?
        TEMP DB 5 DUP(0)
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,HEX
        MOV DX,0
        MOV SI,0
        MOV BX,0AH
        BACK:
              DIV BX
              MOV TEMP[SI],DL
              MOV DX,0
              INC SI
              CMP AX,0
         JNZ BACK

         MOV SI,0
         MOV AL,TEMP[SI+1]
         MOV CL,04
         ROR AL,CL
         ADD AL,TEMP[SI]
         MOV AH,TEMP[SI+3]
         ROR AH,CL
         ADD AH,TEMP[SI+2]
         MOV WORD PTR BCD,AX
         MOV DL,TEMP[SI+4]
         MOV BCD+2,DL

         MOV AH,4CH
         INT 21H
     CODE ENDS
END START
