Data Segment
        chr db ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AH, 07H
                INT 21H

                MOV DL, AL
                MOV AH, 02H
                INT 21H

                MOV AH, 4CH
                INT 21H

        Code ends
        end Start
