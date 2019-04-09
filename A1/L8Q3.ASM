DATA SEGMENT
  RD1      DB 'ENTER 2 DIGIT DECIMAL NUMBERS:$'
  NXTLINE  DB 10,13,'$'
  RD2      DB 'THE SUM IS:$'
  TEMP     DB 3 DUP(0)
  M        DB ?
  N        DB ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA

DISP MACRO MSG
 LEA DX,MSG
 MOV AH,09
 INT 21H
ENDM


 CONVERTO:           ;ASSUME NUMBER IN DL,CONVERT TO ASCII
  CMP DL,0AH ;10
  JC NEXT1
    ADD DL,07H
  NEXT1: ADD DL,30H
 RET

 BCD_HEX:            ;ASSUME BCD NUMBER IN AL
  MOV AH,0
  MOV BL,16
  DIV BL
  MOV CL,AH
  MOV BL,0AH
  MUL BL
  ADD AL,CL          ; FINALLY AL HAS HEX VALUE
 RET

 HEX_BCD:
    MOV AH,0
    MOV SI,0
    MOV BL,0AH
    BACK:
          DIV BL
          MOV TEMP[SI],AH
          MOV AH,0
          INC SI
         CMP AL,0
         JNZ BACK
 RET


START:
        MOV AX,DATA
        MOV DS,AX

        DISP RD1
        MOV AH,01
        INT 21H
        SUB AL,30H

        MOV BL,10H
        MUL BL
        MOV M,AL

        MOV AH,01
        INT 21H
        SUB AL,30H

        CALL BCD_HEX
        ADD M,AL     ;FIRST 2 DIGIT HEX NUMBER



        DISP NXTLINE
        DISP RD1
        MOV AH,01
        INT 21H
        SUB AL,30H

        ;MOV BL,10H -REDUNDANT
        MUL BL
        MOV N,AL

        MOV AH,01
        INT 21H
        SUB AL,30H

        CALL BCD_HEX
        ADD N,AL     ;SECOND 2 DIGIT HEX NUMBER


         ; ADDING 2 HEXADECIMAL NUMBERS AND STORE IT IN AL

         MOV AL,M  ; MAXIMUM HEXADECIMAL NUMBER POSSIBLE IS 63H FOR 99d
         ADD AL,N   ;63H+63H=C6H , SO IT DOSEN'T REQUIRE A CARRY
         

        ;DISPLAYING BCD NUMBER FROM TEMP ARRAY

        DISP NXTLINE
        DISP RD2
        MOV SI,02
        BK:
            MOV DL,TEMP[SI]
            ADD DL,30H
            MOV AH,02
            INT 21H
           DEC SI
           JNC BK

        MOV DL,'d'
        MOV AH,02
        INT 21H

        MOV AH,4CH
        INT 21H
        
    CODE ENDS
END START
