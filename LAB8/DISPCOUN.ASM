Data Segment
        bin db ?
        counter db 0H
Data ends
Code segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                MOV AX, 0000H

                MOV CL, 16
                LEA SI, bin
        Feeder:
                MOV AH, 01H
                INT 21H
                MOV [SI], AL
                INC SI
                LOOP Feeder

                LEA SI, bin
                MOV AL, counter
                MOV CL, 16
                looper:
                        CMP SI, 31H
                        JNE skip
                        INC AX
                skip:
                        INC SI
                        Loop Looper
                ADD AL, 0H
                DAA
                ADD AL, 30H
                MOV counter, AL

                MOV DL, [counter]
                MOV AH, 02H
                INT 21H

                MOV DL, [counter+1]
                MOV AH, 02H
                INT 21H

                MOV AH, 4CH
                INT 21H

        Code ends
        end Start

