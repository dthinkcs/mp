Data Segment
        num1 dW 0A15EH
        num2 dW 7FA1H
        num3 dW 2E3AH
        num4 dW 0E21F
        ans dW ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                hcfM MACRO x, y, Ans
                        MOV DX, 0000H
                        DIV y
                        CMP DX, 0000H
                        JE quit
                        MOV x, DX
                        JMP begin
                endm

                MOV AX, num1
                MOV BX, num2
        begin1:
                CMP AX, BX
                JA noxc
                XCHG AX, BX
                
        noxc1:
                hcfM AX, BX, CX

        quit1:
                MOV ans, BX

                MOV AX, num3
                MOV BX, num4
        begin2:
                CMP AX
                hcfM AX, BX, CX

                hcfM CX, ans

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
