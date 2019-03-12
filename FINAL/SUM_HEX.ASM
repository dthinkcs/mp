DATA SEGMENT
	MSG1 DB 'ENTER 2 DIGIT HEXA NUMBER:'
	NEXTL DB 10,13,'$'
	MSG2 DB 'SUM:$'
	A DB ?
	B DB ?
	SUM DW 0
DATA ENDS

 PRINT MACRO MSG
 LEA DX,MSG
 MOV AH,09
 INT 21H
 ENDM

CODE SEGMENT

   ASSUME CS:CODE, DS:DATA

  START:
     MOV AX,DATA
     MOV DS,AX

     PRINT MSG1
     CALL GET_2DIGIT_HEXA
     PRINT NEXTL
     MOV A,AL

     PRINT MSG1
     CALL GET_2DIGIT_HEXA
     PRINT NEXTL
     MOV B,AL

     MOV AH,0
     ADD AL,A
     ADC AH,0
     MOV SUM,AX

     PRINT MSG2
     PRINT NEXTL
     MOV AX, SUM
     CALL DISP
     MOV AH,4CH
     INT 21H

     GET_2DIGIT_HEXA:
     ;TENS DIGIT
        MOV AH,01
        INT 21H
        CMP AL,39H
        JBE DEEC
        SUB AL,07H
     DEEC:
        SUB AL,30H
        MOV CL,04
        SHL AL,CL
        MOV BL,AL ; BL:N0H  

     ;ONES DIGIT
        MOV AH,01
        INT 21H
        CMP AL,39H
        JBE DEC2
        SUB AL,07H
     DEC2:
        SUB AL,30H

        ADD BL,AL  ;HEXA NUMBER: BL
        MOV AL,BL   ;AL=BL
        RET



     DISP:
        MOV BL,AL

        MOV DL,AH  ; DISP HUNDREDS DIGIT
        ADD DL,30H
        MOV AH,02H
        INT 21H

        MOV AL,BL
        AND AL,0F0H ; DISP TENS DIGIT
        MOV CL,04
        SHR AL,CL
        ADD AL,30H
        CMP AL,39H
        JBE X
        ADD AL,07H
       X:
        MOV DL,AL
        MOV AH,02H
        INT 21H

        AND BL,0FH  ; DISP ONES DIGIT
        MOV AL,BL
        ADD AL,30H
        CMP AL,39H
        JBE X2
        ADD AL,07H
       X2:
        MOV DL,AL
        MOV AH,02H
        INT 21H
        RET
    CODE ENDS
 END START

