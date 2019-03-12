Data Segment
        Array1 DW 59CDH, 7B2EH, 0C4D8H, 92C4H, 6EA1H, 1EE1H, 0C453H, 0E42AH, 0EE22H, 2EA3H
        Array2 DW 10 dup(?)
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, [Array1+18]
                LEA DI, Array2

                MOV CX, 10

        ZOOP:

                MOV AX, [SI]
                MOV [DI], AX

                DEC SI
                DEC SI
                INC DI
                INC DI

                LOOP ZOOP

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
