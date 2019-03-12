Code Segment
        Assume CS:Code
        Start:
                MOV AH,08H
                INT 21H
                MOV BH,AL
                MOV AH,01H
                INT 21H
                MOV DL,AL
                MOV AH,02H
                INT 21H
                MOV DL,BH
                INT 21H
                MOV AH,4CH
                INT 21H
Code ends
end Start

