Data Segment
        num1 dw 5E21H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX, num1
                MUL num1

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
