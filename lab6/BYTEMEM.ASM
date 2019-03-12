Data Segment
        num1 dB 0B4H
        num2 dB ?       ;calls next offset
Data ends
Code Segment
        Assume CS: Code, DS: Data
        Start:
                MOV AX, Data    ;Data->base addr of data segment 
                MOV DS, AX      ;Initialise data segment from data segments base addr
                MOV AL, num1
                MOV num2, AL
                MOV AH,4CH
                INT 21H
        Code ends
        end Start

