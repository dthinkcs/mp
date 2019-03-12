Data Segment
        num1 dW 0A15EH
        num2 dW 7FA1H
        ans dW ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                hcfM MACRO x, y, Ans
                begin:
                        CMP x, y
                        JA noxc
                        xchg x, y
                noxc:
                        MOV DX, 0000H
                        DIV y
                        CMP DX, 0000H
                        JE quit
                        MOV x, DX
                        JMP begin
                quit:
                        MOV Ans, BX
                endm

                MOV AX, num1
                MOV BX, num2
                hcfM AX, BX, CX

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
