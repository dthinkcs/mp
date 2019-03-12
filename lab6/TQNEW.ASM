Data Segment
        array1 db 21H, 5CH, 0A2H, 22H, 91H
        array2 db 2 dup(?)
Data ends

Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, Array1
                LEA DI, Array2

                MOV BL, 02; div by 2
                MOV CL, 05; counter
        Back:
                MOV AH, 0
                MOV AL, [SI]
                DIV BL
                INC SI
                CMP AH, 0H
                JZ Down

                ADD Array2, 1
                Loop Back

                JMP quit

        Down:   ADD Array2+1, 1
                Loop Back

        quit:    MOV AH, 4CH
                INT 21H
        Code ends
        end Start
