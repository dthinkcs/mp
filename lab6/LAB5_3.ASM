Data Segment
        num1 db 1AH
        num2 db 2DH
        ans db ?
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
                        XCHG x, y
                noxc:
                        MOV AH, 00H
                        DIV y
                        CMP AH, 00H
                        JE quit
                        MOV x, AH
                        JMP begin
                quit:
                        MOV Ans, y
                endm

                MOV AL, num1
                MOV BL, num2
                hcfM AL, BL, ans

                MOV AL, num1
                MOV BL, num2
                MUL BL

                MOV BL, ans
                DIV BL

                MOV BL,AX
                MOV AL, 0

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
