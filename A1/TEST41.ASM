DATA SEGMENT
     A DB 1
     UPDOWN DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE

HEX_ASCII:
    CMP DL,0AH
    JC L1
      ADD DL,7
    L1: ADD DL,30H
RET

DELAY:
        MOV DI,0FFFFH
        BACK2:
              MOV SI,0FFFFH
              BACK1:
                    DEC SI
              JNZ BACK1
              DEC DI
        JZ BACK2
RET

NEW_PROS:

        MOV AL,A
        MOV AH,0
        MOV BL,10H
        DIV BL
        MOV BX,AX

        MOV DL,BL
        CALL HEX_ASCII
        MOV AH,02
        INT 21H

        MOV DL,BH
        CALL HEX_ASCII        
        MOV AH,02
        INT 21H

        MOV DL,'H'
        MOV AH,02
        INT 21H


RET


START:
        MOV AX,DATA
        MOV DS,AX

      BK:
         CALL NEW_PROS

         MOV DL,13
         MOV AH,2
         INT 21H
         CALL DELAY
         

         MOV DL,0FFH
         MOV AH,6
         INT 21H

         CMP AL,'U'
         JNZ DOWN1
             MOV UPDOWN,0
         DOWN1: CMP AL,'D'
                JNZ NOTHING_1
                MOV UPDOWN,1

         NOTHING_1:
           CMP UPDOWN,0
           JZ LAB1
              DEC A
              JMP NOTHING1
           LAB1: INC A

       NOTHING1:
         CMP AL,0
       JZ BK

        MOV AH,4CH
        INT 21H
CODE ENDS
END START

