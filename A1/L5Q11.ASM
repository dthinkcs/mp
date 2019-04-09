DATA SEGMENT
        HEX DB ?
        BCD DW ?
        TEMP DB 3 DUP(0)
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,HEX
        MOV AH,0
        MOV SI,0
        MOV BL,0AH
        BACK:
              DIV BL
              MOV TEMP[SI],AH
              MOV AH,0
              INC SI
              CMP AL,0
         JNZ BACK

         MOV SI,0
         MOV AL,TEMP[SI+1]
         MOV CL,04
         ROR AL,CL
         ADD AL,TEMP[SI]
         MOV AH,TEMP[SI+2]
         MOV BCD,AX

         MOV AH,4CH
         INT 21H
     CODE ENDS
END START
