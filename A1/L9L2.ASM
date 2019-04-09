DATA SEGMENT
        MAXLEN1 DB 20
        LEN1    DB ?
        STR1    DB 20 DUP('$')

        STR2    DB 20 DUP('$')
        PAL     DB 'IT IS A PALINDROME$'
        NPAL    DB 'IT IS NOT A PALINDROME$'
        RD      DB 'ENTER A STRING:$'
        NXTLINE DB 10,13,'$'


DATA ENDS


CODE SEGMENT
        ASSUME CS:CODE,DS:DATA

DISP MACRO MSG
        LEA DX,MSG
        MOV AH,09H
        INT 21H
ENDM

START:
        MOV AX,DATA
        MOV DS,AX
        MOV ES,AX

        DISP RD
        LEA DX,MAXLEN1
        MOV AH,0AH
        INT 21H

        DISP NXTLINE

        MOV CH,0
        MOV CL,LEN1
        LEA SI,STR1
        ADD SI,CX
        DEC SI
        LEA DI,STR2
        BACK:
           MOVSB
           DEC SI
           DEC SI
        LOOP BACK

        LEA SI,STR1
        LEA DI,STR2

        MOV CH,0
        MOV CL,LEN1
        REPE CMPSB
        JNZ NP
        DISP PAL
        JMP EXIT
        NP: DISP NPAL
      EXIT: MOV AH,4CH
            INT 21H


       CODE ENDS
END START
