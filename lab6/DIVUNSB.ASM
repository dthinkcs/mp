Data Segment
        NUM1 dw 0E2A2H
        NUM2 db 0E6H
; TODO TODO TODO
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX,NUM1
                DIV NUM2

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
