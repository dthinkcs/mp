DATA SEGMENT
N1 dD 0A714DA2DH

N2 dD 0D2D781F2H

        sum dD 00000000H
        carry dB 00H
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
mov ax,data
mov ds,ax
                CLC
                LEA SI, N1
                LEA DI, N2
                LEA BX, sum
                MOV CX, 02H
        BACK:
                MOV AX, [SI]
                ADC AX, [DI]
                MOV [BX], AX
                INC SI
                INC SI
                INC DI
                INC DI
                INC BX
                INC BX
                Loop BACK
                ADC carry,0
                MOV AH,4CH
INT 21H
CODE ENDS
END START
