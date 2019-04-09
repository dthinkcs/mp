Data Segment
        num1 db 0A4H
        num2 db 12H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AL,num1
                MOV BL,NUM2
                IMUL BL

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
