Data Segment
        NUM1 dD 0000FC32H
        NUM2 dW 1234H
        Q DB ?
        R DB ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV SI,0
                MOV BX,NUM2
                LEA SI,NUM1
                MOV AX,[SI]
                INC SI
                INC SI
                MOV DX,[SI]
                DIV BX
                MOV Q,AL
                MOV R,AH

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
