DATA SEGMENT
        NUM DW 4 DUP (?)
        TEMP DW 2 DUP (?)
        RES DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV DX, DATA
        MOV DS, DX

        MOV SI, 0
        MOV DI, 0
		MOV CX, 02
		
		BACK:
			MOV AX, WORD PTR NUM[SI]
			INC SI
			INC SI
			MOV BX, WORD PTR NUM[SI]
			CALL GCD
			MOV WORD PTR TEMP[DI], BX
			INC SI
			INC SI
			INC DI
			INC DI
			LOOP BACK

        MOV DI, 0
        MOV AX, WORD PTR TEMP[DI]
        INC DI
        INC DI
        MOV BX, WORD PTR TEMP[DI]
        CALL GCD
        MOV RES, BX

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

        RET

CODE ENDS
END START
