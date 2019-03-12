Data Segment
        nums dB 00H, 13H, 61H, 0A2H, 32H, 0E1H, 20H, 05H, 0F2H, 0E2H
        search dB 32H
        ind dW ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, nums
                MOV AL, search
                Call linsearch
                MOV AH,4CH
                INT 21H
                LinSearch PROC
                        MOV CL, 10
                Beg:
                        CMP [SI], AL
                        JE Found
                        INC SI
                        Loop Beg
                        RET
                Found:
                        MOV ind, SI
                        RET
                LinSearch endp


        Code ends
        end Start

