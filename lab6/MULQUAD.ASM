Data Segment
        num1 dw 8134H
        carrytmp db 00H
        bitfix db 04H
        decimal db 0AH

Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX
                MOV CX,3
                MOV BX, 00H
        Reload:
                MOV AX,CX
                MUL bitfix
                MOV DX, AX
                MOV AX, num1
                SHR AX, DX
                MUL decimal
                ADD BX, AX
                ADC carrytmp, 0
                Loop Reload

                MOV AH, 4CH
                INT 21H
Code ends
end Start
