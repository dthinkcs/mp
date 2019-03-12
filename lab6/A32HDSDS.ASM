Data Segment
        num1 dD 0A714DA2DH
        num2 dD 0D2D781F2H

        sum dD 00000000H
        carry dB 00H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX,Data
                MOV DS, AX

                CLC
                LEA SI, num1
                LEA DI, num2
                LEA BX, sum
                MOV CX, 02H
        foo:
                MOV AX, [SI]
                ADC AX, [DI]
                MOV [BX], AX
                INC SI
                INC SI
                INC DI
                INC DI
                INC BX
                INC BX
                Loop foo
                ADC carry,0

                MOV AH,4CH
                INT 21H
        Code ends
        end Start

                
