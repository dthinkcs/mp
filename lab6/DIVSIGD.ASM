Data Segment
        NUM1 dd 0E235D2B1H
        NUM2 dw 0E6A2H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, NUM1
                MOV AX, [SI]
                MOV DX, [SI+2]
                IDIV NUM2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
