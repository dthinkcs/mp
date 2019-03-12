DATA SEGMENT
        A    DB 32H,12H,15H,64H,64H,54H,81H,99H,29H,43H
        ELE  DB 99H
        FND  DB 'FOUND$'
        NFND DB 'NOT FOUND$'
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:

   MOV AX,DATA
   MOV DS,AX
   MOV SI,0
   LEA DX,NFND
   BACK:
        MOV BL,A[SI]
        CMP BL,ELE
        JNZ SKIP
          LEA DX,FND
          JMP EXIT
        SKIP:
          INC SI
              
    CMP SI,10
    JNZ BACK

    EXIT: MOV AH,09
          INT 21H


   MOV AH,4CH
   INT 21H

   CODE ENDS
END START
