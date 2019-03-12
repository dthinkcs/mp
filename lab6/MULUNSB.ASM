Data Segment
        NUM1 db 0E2H
        NUM2 db 0A6H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AL,NUM1
                MUL NUM2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
