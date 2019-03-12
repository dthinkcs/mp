DATA SEGMENT
        A DW ?
        B DW ?
        RES DW ?
DATA ENDS



CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV DX, DATA
        MOV DS, DX

        MOV AX, A
        MOV BX, B

        CALL GCD

        MOV AH, 4CH
        INT 21H


        GCD:

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

        RET

CODE ENDS
END START
