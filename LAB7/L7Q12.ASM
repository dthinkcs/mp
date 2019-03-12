DATA SEGMENT
        A    DW 1232H,2312H,4515H,7564H,7864H,3254H,4568H,2299H,5429H,6243H
        ELE  DW 2299H
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
        MOV BX,A[SI]
        CMP BX,ELE
        JNZ SKIP
          LEA DX,FND
          JMP EXIT
        SKIP:
          INC SI
          INC SI
          
              
    CMP SI,20
    JNZ BACK

    EXIT: MOV AH,09
          INT 21H


   MOV AH,4CH
   INT 21H

   CODE ENDS
END START
