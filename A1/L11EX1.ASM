CODE SEGMENT
        ASSUME CS:CODE
START:
        MOV AL,3
        MOV AH,0
        INT 10H

        MOV BL,12
        MOV BH,40

        MOV AL,160
        MUL BL
        MOV SI,AX

        MOV CL,BH
        SHL CL,1
        MOV CH,0
        ADD SI,CX

        MOV AX,0B800H
        MOV DS,AX
        MOV BYTE PTR[SI],'*'
        MOV BYTE PTR[SI+1],04H

        MOV AH,4CH
        INT 21H

     CODE ENDS
 END START
