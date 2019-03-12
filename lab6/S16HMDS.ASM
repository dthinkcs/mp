Data Segment
        num1 dW 8A2EH
        num2 dW 0A3E2H

        diff dQ 00
        borrow dB 00
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX,Data
                MOV DS, AX

                CLC
                ADC
                
                ADC AX, num2
                MOV sum, AX
                ADC carry,0

                MOV AH,4CH
                INT 21H
        Code ends
        end Start

                
