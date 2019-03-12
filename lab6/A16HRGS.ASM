Data Segment
        sum dW 0000H
        carry dB 00H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX,Data
                MOV DS, AX

                MOV AX, 7A3DH
                MOV BX, 0AD34H
                CLC
                ADC AX,BX
                MOV sum, AX
                ADC carry,0

                MOV AH,4CH
                INT 21H
        Code ends
        end Start

                
