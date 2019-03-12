Data Segment
        num1 dB 220
        num2 dB 254

        sum dB 00
        carry dB 00
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX,Data
                MOV DS, AX

                MOV AH, num1
                CLC
                ADC AH, num2
                MOV sum, AH
                ADC carry,0

                MOV AH,4CH
                INT 21H
        Code ends
        end Start

                
