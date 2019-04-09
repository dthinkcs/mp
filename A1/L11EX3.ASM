DATA SEGMENT
   A DB 'MANIPAL$'

DATA ENDS


CODE SEGMENT
        ASSUME CS:CODE
START:

        MOV AL,3    ; INITIALSED BELOW ,SO ITS USELESS HERE
        MOV AH,0
        INT 10H

        MOV AX,DATA
        MOV BP,AX
        MOV DS,AX
        LEA DI,A

        MOV BL,12 ; SETTING POSITION
        MOV BH,40

    BK1:
        MOV DH,0  ; USED AS COUNTER

        MOV AX,DATA
        MOV DS,AX
        LEA DI,A
    BACK:
        MOV DS,BP
        MOV DL,[DI]

        MOV AH,0
        MOV AL,160
        MUL BL
        MOV SI,AX

        MOV CL,BH
        ADD CL,DH ;INCREASING COLUMNS

        SHL CL,1
        MOV CH,0
        ADD SI,CX

        MOV AX,0B800H
        MOV DS,AX
        MOV BYTE PTR[SI],DL
        MOV BYTE PTR[SI+1],04H

        INC DI
        INC DH
        CMP DH,7
      JNZ BACK


    
        MOV AH,2
        INT 21H

        CMP AL,'U'
        JNZ L1
         SUB BL,1

       L1:
        CMP AL,'D'
        JNZ L2
         ADD BL,1

       L2:
        CMP AL,'L'
        JNZ L3
         SUB BH,1

       L3:
        CMP AL,'R'
        JNZ L4
         ADD BH,1

       L4:
        CMP AL,'Q'
        JZ EXIT
       
    JMP BK1

      EXIT:
        MOV AH,4CH
        INT 21H

     CODE ENDS
 END START
