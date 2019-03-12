Data Segment
        MEMF DB 00H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, MEMF
                LEA DI, [SI+2]

                MOV AH, 01H

                INT 21H

                MOV CX, AL

                MOV AX, 01H

        ZOOP:

                ADD AX, [SI]
                MOV [DI], AX
                INC SI
                INC DI

                LOOP ZOOP

                MOV AH, 4CH
                INT 21H
        Code ends
        end Start
