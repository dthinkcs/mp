Data Segment
        Array1 DB 59H, 7BH, 0CDH, 9CH, 6AH, 88H, 0CAH, 5FH, 0E2H, 23H
        Array2 DB 10 dup(?)
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, [Array1+10]
                LEA DI, [Array2+5]

                MOV CX, 10

        ZOOP:

                MOV AL, [SI]
                MOV [DI], AL

                DEC SI
                DEC DI

                LOOP ZOOP

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
