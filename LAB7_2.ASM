Data Segment
        nums dB 00H, 13H, 61H, 0A2H, 32H, 0E1H, 20H, 05H, 0F2H, 0E2H
        search dB 32H
        ind dW ?
        msgf dB "Seach found at:$"
        varprnt dW 0, "$"
        msgnf dB "Search couldn't find number$"
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, nums
                MOV AL, search
                Call LinSearch
                MOV AH,4CH
                INT 21H
                LinSearch PROC
                        MOV CL, 10
                Beg:
                        CMP [SI], AL
                        JE Found
                        INC SI
                        Loop Beg
                        LEA DX, msgnf
                        MOV AH, 09H
                        INT 21H
                        RET
                Found:
                        LEA DX, msgf
                        MOV AH, 09H
                        INT 21H
                        MOV AX, SI
                        MOV [varprnt], AX
                        MOV DX, varprnt
                        MOV AH, 09H
                        INT 21H
                        RET
                LinSearch endp
        Code ends
        end Start

