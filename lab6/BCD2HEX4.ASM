Data Segment
        BCD dW 4125H
        HEX dW ?
        Carry dW ?
        ShiftVal dW 0000H
        counter dB 03H
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                CLC

                LOOPER:
                        MOV CL, counter
                        MOV AX, 0001H
                        
                        LOOP2:
                                MOV DL, 0AH;
                                MUL DL;
                                SUB CL,01H
                                CMP CL,00H
                                JG LOOP2

                        MOV ShiftVal, AX

                        MOV AX, 0000H

                        MOV CL, counter

                        MOV AL, 04H

                        MUL CL

                        MOV CL, AL

                        MOV AL, 0000H

                        MOV BX, 0000H

                        MOV BX, BCD

                        SHR BX, CL

                        MOV DX, BX

                        SHL DX, CL

                        XOR DX, BCD

                        MOV BCD, DX

                        MOV AX, ShiftVal

                        MUL BX;

                        CLC

                        ADC HEX, AX
                        ADC Carry, DX

                        MOV BL, counter

                        SUB BL, 01H
                        MOV counter, BL

                        CMP BL, 00H
                        JG LOOPER

                        MOV AH, 4CH
                        INT 21H
                Code ends
                end Start




