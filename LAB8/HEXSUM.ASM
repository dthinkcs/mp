Data Segment
        t1 db 61H
        t2 db 63H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV CL, 4

                MOV AH, 01H
                INT 21H

                MOV BL, AL

                MOV AH, 01H
                INT 21H

                MOV AH, 00H

                SUB AL, 30H
                SUB BL, 30H

                CMP AL, 0AH
                JL skipsuba

                SUB AL, 07H

                skipsuba:

                CMP BL, 0AH
                JL skipsubb

                SUB BL, 07H

                skipsubb:

                ADD AL, BL

                MOV DH, AL

                SHR DH, CL

                MOV AH, DH

                MOV DH, AL

                SHL DH, CL

                SHR DH, CL

                MOV AL, DH

                ADD AH, 30H
                ADD AL, 30H

                MOV DL, AH
                MOV AH, 02H
                INT 21H

                MOV DL, AL
                MOV AH, 02H
                INT 21H

                MOV AH, 4CH
                INT 21H

        Code ends
        end Start
                       
