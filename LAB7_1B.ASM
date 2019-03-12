Data Segment
        nums dW 0026H, 0A213H, 6AE1H, 0EA22H, 3AA2H, 0E111H, 2018H, 03A5H, 0F25FH, 0E2EEH
        search dW 0E111H
        ind dW ?
Data ends
Code Segment
        Assume CS:Code, DS:Data
        Start:
                MOV AX, Data
                MOV DS, AX

                LEA SI, nums
                MOV AX, search
                Call linsearch
                MOV AH,4CH
                INT 21H
                LinSearch PROC
                        MOV CL, 10
                Beg:
                        CMP [SI], AX
                        JE Found
                        INC SI
                        INC SI
                        Loop Beg
                        RET
                Found:
                        MOV AX, SI
                        MOV CL, 01H
                        SHR AX, CL
                        MOV ind, AX
                        RET
                LinSearch endp


        Code ends
        end Start

