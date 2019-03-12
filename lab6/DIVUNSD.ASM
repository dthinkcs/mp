Data Segment
        NUM1 dd 0E235D2B1H
        NUM2 dw 0E6A2H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data; moving Data into DS
                MOV DS, AX

                LEA SI, NUM1; SI <- &(NUM1)
                MOV AX, [SI]; AX <- *(SI)
                MOV DX, [SI+2]; DX <- *(SI + 2B)
                DIV NUM2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
