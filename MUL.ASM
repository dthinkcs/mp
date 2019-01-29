Data Segment
        num1 dW 0E2EEH
        num2 dW 0AE26H

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AL,num1
                IMUL num2

                MOV AX, 4CH
                INT 21H
        Code ends
        end Start
