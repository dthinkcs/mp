Data Segment
        NUM1 dw 8134H
        NUM2 dw 0A3A3H
     

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX,NUM1
                MUL NUM2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
