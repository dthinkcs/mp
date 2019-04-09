DATA SEGMENT
  RD1      DB 'ENTER 2 HEX DIGIT CHARACTERS:$'
  NXTLINE DB 10,13,'$'
  RD2      DB 'THE SUM IS:$'
  M        DB ?
  N        DB ?
  CARRY    DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA

DISP MACRO MSG
 LEA DX,MSG
 MOV AH,09
 INT 21H
ENDM


CONVERT:             ;ASSUME ASCII IS IN AL
 CMP AL,'A'
 JC NEXT
   SUB AL,07H
 NEXT: SUB AL,30H
 RET


 CONVERTO:           ;ASSUME NUMBER IN DL,CONVERT TO ASCII
  CMP DL,0AH ;10
  JC NEXT1
    ADD DL,07H
  NEXT1: ADD DL,30H
 RET

START:
        MOV AX,DATA
        MOV DS,AX

        DISP RD1
        MOV AH,01
        INT 21H
        CALL CONVERT

        MOV BL,10H
        MUL BL
        MOV M,AL

        MOV AH,01
        INT 21H
        CALL CONVERT

        ADD M,AL     ;FIRST 2 DIGIT HEX NUMBER

        DISP NXTLINE
        DISP RD1
        MOV AH,01
        INT 21H
        CALL CONVERT

        ;MOV BL,10H -REDUNDANT
        MUL BL
        MOV N,AL

        MOV AH,01
        INT 21H
        CALL CONVERT

        ADD N,AL     ;SECOND 2 DIGIT HEX NUMBER


         MOV BL,M
         ADD BL,N
         ADC CARRY,0   ; BL HAS THE SUM

         ;DISPLAYING AFTER ADDING

         DISP NXTLINE
         DISP RD2
         MOV DL,CARRY
         CALL CONVERTO
         MOV AH,02
         INT 21H

         MOV AH,0
         MOV AL,BL
         MOV CL,10H
         DIV CL
         MOV BX,AX
         MOV DL,BL
         CALL CONVERTO
         MOV AH,02
         INT 21H
         MOV DL,BH
         CALL CONVERTO
         MOV AH,02
         INT 21H
         MOV DL,'H'
         MOV AH,02
         INT 21H

        MOV AH,4CH
        INT 21H
        
    CODE ENDS
END START
