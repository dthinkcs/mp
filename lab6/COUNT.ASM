Data Segment
        nums db 0A6H, 0E2H, 12H, 44H, 0A3H, 91H, 2AH, 9BH, 0E3H, 8AH
        count db 2 dup(?)
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, nums
                LEA DI, count

                MOV CL, 10

        Looper:
                MOV AL, [SI]
                ADD AL, 0
                JS signed
                MOV BL, [DI]
                ADD BL, 01H
                MOV [DI], BL
                INC SI
                Loop Looper
                JMP quit
        Signed:
                MOV BL, [DI+1]
                ADD BL, 01H
                MOV [DI+1], BL
                INC SI
                Loop Looper

        Quit:
                MOV AH, 4CH
                INT 21H

        Code ends
        end Start
                


