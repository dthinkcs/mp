DATA SEGMENT
  RD1      DB 'ENTER A CHARACTER WITHOUT ECHO:$'
  NXTLINE DB 10,13,'$'
  RD2      DB 'ENTER A CHARACTER WITH ECHO:$'
  RD3      DB 'DISPLAY CHARACTERS:$'
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


START:
        MOV AX,DATA
        MOV DS,AX

        DISP RD1
        MOV AH,08
        INT 21H
        MOV M,AL

        DISP NXTLINE
        DISP RD2
        MOV AH,01
        INT 21H
        MOV N,AL

        DISP NXTLINE
        DISP RD3
        MOV DL,M
        MOV AH,02
        INT 21H
        MOV DL,' '
        MOV AH,02
        INT 21H
        MOV DL,N
        MOV AH,02
        INT 21H


        MOV AH,4CH
        INT 21H
        
    CODE ENDS
END START
