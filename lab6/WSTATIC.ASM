Data Segment
        Array1 DW 597BH, 0CD9CH, 6A88H, 0CA5FH, 0E223H
        Array2 DW 5 dup(?)
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, Array1
                LEA DI, Array2

                MOV CX, 5

        ZOOP:

                MOV AX, [SI]
                MOV [DI], AX

                INC SI
                INC SI
                INC DI
                INC DI

                LOOP ZOOP

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
