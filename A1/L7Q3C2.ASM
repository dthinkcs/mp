DATA SEGMENT
        A  DB 99H,88H,77H,66H,55H,44H
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
                   MOV AL,A[DI]
                   CMP AL,A[DI+1]
                   JL SKIP
                   XCHG AL,A[DI+1]
                   MOV A[DI],AL

                   SKIP:INC DI
                        LOOP BACK1


             INC SI
             CMP SI,BX
             JC BACK2


         MOV AH,4CH
         INT 21H
     CODE ENDS
END START








