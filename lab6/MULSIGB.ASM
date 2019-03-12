Data Segment
        num1 db 0E2H
        num2 db 0A6H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AL,num1
                IMUL num2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
