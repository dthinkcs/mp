DATA SEGMENT
        A DB 'HAI$'
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA


       


START:

        MOV AL,3
        MOV AH,0
        INT 10H

        MOV AX,DATA
        MOV BP,AX
        MOV DS,AX
        LEA DI,A


        MOV BL,12
        MOV BH,40

        MOV SP,1
    BK1:

        MOV AX,DATA
        MOV BP,AX
        MOV DS,AX
        LEA DI,A

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
        CMP DH,3
      JNZ BACK

      MOV DL,0FFH
      MOV AH,6
      INT 21H

      CMP AL,0
      JZ EXIT

      CMP BL,0
      JNZ L1
        MOV SP,0

      L1: 
         CMP BL,24
         JNZ L2
         MOV SP,1

      L2:
         CMP SP,0
         JZ L3
            DEC BL
            JMP L4
         L3: INC BL

      L4: JMP BK1



      EXIT:
        MOV AH,4CH
        INT 21H

     CODE ENDS
 END START



