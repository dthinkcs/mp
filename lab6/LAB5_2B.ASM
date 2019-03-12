Data Segment
        num1 dW 0A15EH
        num2 dW 7FA1H
        num3 dW 8A3EH
        num4 dW 0D31AH
        ans dW ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX, num1
                MOV BX, num2

                CALL hcfM

                MOV ans, CX

                MOV AX, num3
                MOV BX, num4

                CALL hcfM

                MOV AX, CX
                MOV BX, ans

                CALL hcfM

                MOV ans, CX

                MOV AH, 4CH
                INT 21H

                hcfM PROC
                begin:
                        CMP AX, BX
                        JA noxc
                        XCHG AX, BX
                noxc:
                        MOV DX, 0000H
                        DIV BX
                        CMP DX, 0000H
                        JE quit
                        MOV AX, DX
                        JMP begin
                quit:
                        MOV CX, BX
                        RET
                hcfM endp

        Code ends
        end Start
