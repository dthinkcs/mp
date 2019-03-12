Data Segment
        num1 db 0A1H
        num2 db 5EH
        num3 db 7FH
        num4 db A1H
        ans db ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AL, num1
                MOV BL, num2

                CALL lcmP

                MOV AH, 4CH
                INT 21H

                lcmP PROC
                begin:
                        MOV DL, AL
                        MOV DH, AH
                        CMP AL, BL
                        JA noxc
                        XCHG AL, BL
                noxc:
                        MOV AH, 00H
                        DIV BL
                        CMP AH, 00H
                        JE quit
                        MOV AL, AH
                        JMP begin
                quit:
                        MOV ans, BL
                        MOV AL, DL
                        MOV BL, DH
                        MUL BL
                        MOV BL, ans
                        DIV BL



                        RET
                hcfM endp

        Code ends
        end Start
