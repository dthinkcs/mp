DATA SEGMENT
        MAXLEN1 DB 20
        LEN1    DB ?
        STR1    DB 20 DUP('$')

        MAXLEN2 DB 20
        LEN2    DB ?
        STR2    DB 20 DUP('$')

        TEMP    DB 20 DUP('$')


        RDMAIN      DB 'ENTER A STRING:$'
        RDSUB       DB 'ENTER A SUB-STRING:$'
        NXTLINE DB 10,13,'$'
        FOUND   DB  'SUB-STRING FOUND$'
        NFOUND  DB  'SUB-STRING NOT FOUND$'
        FND     DB 0

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

        DISP RDMAIN   ; READ MAIN STRING
        LEA DX,MAXLEN1
        MOV AH,0AH
        INT 21H

        DISP NXTLINE

        DISP RDSUB    ; READ SUB-STRING
        LEA DX,MAXLEN2
        MOV AH,0AH
        INT 21H

        DISP NXTLINE

        MOV DX,LEN1
        SUB DX,LEN2
        INC DX  ; DX HAS NUMBER OF ITERATIONS


        LAB1:
              MOV CH,0
              MOV CL,LEN2
              LEA SI,STR1
              LEA DI,TEMP
              REP MOVSB ;COPY TO TEMPORARY STRING

              MOV CH,0
              MOV CL,LEN2
              LEA SI,TEMP
              LEA DI,STR2
              REPE CMPSB
              JNZ MO
                MOV FND,1
                JMP EXIT
              MO:
        DEC DX
        CMP DX,0
        JNE LAB1


        EXIT:
             CMP FND,1
             JNZ NEWLAB
              DISP FOUND
             NEWLAB: DISP NFOUND

             MOV AH,4CH
             INT 21H

       CODE ENDS
END START
