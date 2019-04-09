DATA SEGMENT
   A DB 'MANIPAL$'

DATA ENDS


CODE SEGMENT
        ASSUME CS:CODE
START:
        MOV AL,3
        MOV AH,0
        INT 10H

        MOV AX,DATA
        MOV BP,AX
        MOV DS,AX
        LEA DI,A

        MOV BL,12 ; SETTING POSITION
        MOV BH,40

        MOV DH,0  ; USED AS COUNTER

    BACK:
        MOV DS,BP
        MOV DL,[DI]

        MOV AL,160
        MUL BL
        MOV SI,AX

        MOV CL,BH
        SHL CL,1
        MOV CH,0
        ADD SI,CX

        MOV AX,0B800H
        MOV DS,AX
        MOV BYTE PTR[SI],DL
        MOV BYTE PTR[SI+1],04H

        ADD BH,1  ;INCREASING THE NUMBER OF COLUMNS

        INC DI
        INC DH
        CMP DH,7
      JNZ BACK
        MOV AH,4CH
        INT 21H

     CODE ENDS
 END START
