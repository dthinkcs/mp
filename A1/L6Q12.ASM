DATA SEGMENT
        A DW ?
        B DW ?
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

        MOV AX,A
        MOV BX,B

        CALL DISP

        MOV AH,4CH
        INT 21H


      CODE ENDS
END START
