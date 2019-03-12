DATA SEGMENT
        A  DW 9999H,8888H,7777H,6666H,5555H,4444H
        N  DW 6
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
       MOV AX,DATA
       MOV DS,AX
       MOV SI,0

       BACK2:
             MOV CX,N
             DEC CX
             MOV BX,CX
             SUB CX,SI
             MOV DI,0

             BACK1:
                   MOV AX,A[DI]
                   CMP AX,A[DI+2]
                   JL SKIP
                   XCHG AX,A[DI+2]
                   MOV A[DI],AX

                   SKIP:INC DI
                        INC DI
                        LOOP BACK1


             INC SI
             CMP SI,BX
             JL BACK2


         MOV AH,4CH
         INT 21H
     CODE ENDS
END START








