DATA SEGMENT
        A    DB 32H,12H,15H,64H,64H,54H,81H,99H,29H,43H
        N    DB 10
        MSG  DB 'SMALLEST NUMBER IS:$'
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:

   MOV AX,DATA
   MOV DS,AX
   MOV SI,0
   INC SI
   MOV BL,A[SI]
   MOV CL,N
   MOV CH,0

   BACK:
        CMP BL,A[SI]
        JNC SKIP
          MOV BL,A[SI]
         
        SKIP:
          INC SI
              
    CMP SI,CX
    JNZ BACK

    EXIT:
          LEA DX,MSG
          MOV AH,09
          INT 21H

          CALL BCD_DISP


   MOV AH,4CH
   INT 21H


   BCD_DISP: MOV AH,0
             MOV AL,BL
             MOV CL,10H
             DIV CL
             MOV CX,AX
             ADD CX,3030H
             MOV DL,CL
             MOV AH,02
             INT 21H
             MOV DL,CH
             MOV AH,02
             INT 21H
             MOV DL,'H'
             MOV AH,02
             INT 21H
             RET

   CODE ENDS
END START
