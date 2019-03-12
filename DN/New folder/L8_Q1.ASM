DATA SEGMENT
        MSG DB 'CHARACTER WITH ECHO$'
        MSG1 DB 'CHARACTER WITHOUT ECHO$'
        NEXTLINE DB 10,13,'$'
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA

DISP MACRO MSG
        LEA DX, MSG
        MOV AH, 09
        INT 21H
        ENDM


      START:
                 MOV AX, DATA
                 MOV DS, AX

                 DISP MSG1
                 DISP NEXTLINE

                 MOV AH, 01
                 INT 21H

                 MOV DL, AL
                 MOV AH, 08H
                 INT 21H

                 DISP NEXTLINE
                 DISP MSG
                 DISP NEXTLINE

                 MOV AH, 01
                 INT 21H
                 MOV DL, AL
                 MOV AH, 02H
                 INT 21H

                 MOV AH,  4CH
                 INT 21H

                  CODE ENDS
                  END START

