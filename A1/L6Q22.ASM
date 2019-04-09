DATA SEGMENT
        A DW ?
        B DW ?
        C DW ?
        D DW ?

        T1 DW 0
        T2 DW 0
        GCD DW 0
DATA ENDS


CODE SEGMENT
        ASSUME CS:CODE,DS:DATA

    DISP:
        BACK:
                MOV DX,0
                DIV BX
                CMP DX,0
                JZ EXIT
                MOV AX,BX
                MOV BX,DX
                JMP BACK
        EXIT:
                MOV GCD,BX
    RET


START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A  ;INITIALIZE WITH A & B
        MOV BX,B

        CALL DISP

        MOV DX,GCD
        MOV T1,DX

        MOV AX,C  ;INITIALIZE WITH C & D
        MOV BX,D

        CALL DISP

        MOV DX,GCD
        MOV T2,DX

        MOV AX,T1  ; INITIALIZE WITH T1 & T2
        MOV BX,T2

        CALL DISP

        MOV AH,4CH
        INT 21H


      CODE ENDS
END START
