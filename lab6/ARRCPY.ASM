Data Segment
        Array1 DB 59H, 7BH, 0CDH, 9CH, 6AH
        Array2 DB 5 dup(?)
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, Array1
                LEA DI, Array2

                MOV CX, 5

        INCR:

                MOV AL, [SI]
                MOV [DI], AL

                INC SI
                INC DI

                CMP CX,0
                LOOP INCR

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
