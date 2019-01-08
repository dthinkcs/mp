Data Segment
        multi dW 2H    ;define word
        one dW 1200H
Data ends
Code Segment
        Assume CS: Code, DS: Data
        Start:
                MOV AX, Data    ;Data->base addr of data segment 
                MOV DS, AX      ;Initialise data segment from data segments base addr
                MOV AX, multi
                MOV , AX
                MOV AH,4CH
                INT 21H
        Code ends
        end

