DATA SEGMENT
        MAXLEN1 DB 20
        LEN1    DB ?
        STR1    DB 20 DUP(?)
        PASSWD  DB '123456PJ$'
        LEN2    DB 8
        PASSCOR DB 'PASSWORD CORRECT$'
        PASSINC DB 'PASSWORD INCORRECT$'
        RD      DB 'ENTER YOUR PASSWORD:$'
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

        MOV CL,LEN1
        CMP CL,LEN2
        JNZ NC ;NOT CORRECT

        LEA SI,STR1
        LEA DI,PASSWD
        MOV CH,0
        REPE CMPSB
        JNZ NC
        DISP PASSCOR
        JMP EXIT

        NC: DISP PASSINC

    EXIT: MOV AH,4CH
          INT 21H






        CODE ENDS
END START
