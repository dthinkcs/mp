Data Segment
        num1 dB 31, 14, 66, 27, 88, 71, 91, 35, 16, 22, 44, 15, 82, 25, 64, 18, 24, 26, 2, 99
        sum dB 0
        carry dB 0
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX,Data
                MOV DS, AX

                CLC
                MOV AH, 0
                LEA SI, num1
                MOV AL, [SI]
                MOV CX, 13H
        foo:
                INC SI
                ADC AL, [SI]
                MOV sum, AL
                ADC carry, 0
                Loop foo
                
                MOV AH,4CH
                INT 21H
        Code ends
        end Start

                
