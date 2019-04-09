Data Segment
        NUM1 dw 0E2A2H
        NUM2 db 0E6H
        Q DB ?
        R DB ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX,NUM1
                MOV BL,NUM2
                MOV BH,00H
                IDIV BX
                MOV Q,AL
                MOV R,AH

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
