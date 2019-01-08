Code Segment
        Assume CS: Code
        Start:
                MOV CX, 0A912H   ;A912H shows error as its treated as a name
                MOV DX, CX
                INT 21H
        Code ends
        end Start

