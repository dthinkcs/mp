DATA SEGMENT
    A DW 1005H,1004H,1002H,1003H,1001H
    N DB 05
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    MOV SI,0
    BACK2: MOV BL,N
           MOV BH,0
           DEC BX
           ADD BX,BX

           MOV DI,SI
           INC DI
           INC DI

           BACK1: MOV AX,A[DI]
                  CMP AX,A[SI]
                  JNC SKIP
                  XCHG AX,A[SI]
                  MOV A[DI],AX

           SKIP: INC DI
                 INC DI
                 CMP DI,0AH
                 JC BACK1

           INC SI
           INC SI
           CMP SI,BX
           JC BACK2  

    MOV AH,4CH
    INT 21H

    CODE ENDS
END START
