Data Segment
        num1 dW 0B4A9H  ;define word
        num2 dW ?       ;calls next offset
Data ends
Code Segment
        Assume CS: Code, DS: Data
        Start:
                MOV AX, Data    ;Data->base addr of data segment 
                MOV DS, AX      ;Initialise data segment from data segments base addr
                MOV AX, num1
                MOV num2, AX
                MOV AH,4CH
                INT 21H
        Code ends
        end

