Data Segment
        t1 db 61H
        t2 db 63H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                ;MOV AH, 01H
                ;INT 21H

                ;MOV BL, AL

                ;MOV AH, 01H
                ;INT 21H

                MOV AH, 00H

                MOV AL, t1
                MOV BL, t2

                

                AAA

                MOV BX, AX

                MOV DL, BH
                MOV AH, 02H
                INT 21H

                MOV DL, BL
                MOV AH, 02H
                INT 21H

                MOV AH, 4CH
                INT 21H

        Code ends
        end Start
                       
