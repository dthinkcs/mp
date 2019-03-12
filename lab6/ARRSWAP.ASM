Data Segment
        Array1 DB 59H, 7BH, 0CDH, 9CH, 6AH, 88H, 0CAH, 5FH, 0E2H, 23H
        Array2 DB 12H, 22H, 6FH, 0C3H, 23H, 9AH, 0E5H, 6FH, 34H, 0D9H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, Array1
                LEA DI, Array2

                MOV CX, 10

        ZOOP:

                MOV AL, [SI]
                XCHG [DI], AL
                MOV [SI], AL

                INC SI
                INC DI

                LOOP ZOOP

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
