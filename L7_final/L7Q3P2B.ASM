DATA SEGMENT
    A DB 1005,1004,1003,1002,1001
    N DB 05
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    MOV SI,0
    BACK2: MOV CL,N
           MOV CH,0
           DEC CX
           MOV BX,CX
           SUB CX,SI

           MOV DI,0

           BACK1: MOV AL,A[DI]
                  CMP AL,A[DI+1]
                  JC SKIP
                  XCHG AL,A[DI+1]
                  MOV A[DI],AL

           SKIP: INC DI
                 INC DI
                 LOOP BACK1
                 INC SI
                 INC SI
                 CMP SI,BX
                 JC BACK2  

    MOV AH,4CH
    INT 21H

    CODE ENDS
END START
