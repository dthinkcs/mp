DATA SEGMENT
        A DW ?
        B DW ?
        RES DW ?
DATA ENDS


GCD MACRO A, B
        MOV AX, A
        MOV BX, B

        CMP AX, BX
        JNC L1
        XCHG AX, BX

        L1:
           MOV DX, 0
           DIV BX
           CMP DX, 0
           JZ EXIT
           MOV AX, BX
           MOV BX, DX
           JMP L1

        EXIT:
           MOV RES, BX

ENDM


CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV DX, DATA
        MOV DS, DX

        GCD A, B

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
