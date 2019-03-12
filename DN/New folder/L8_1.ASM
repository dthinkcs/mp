DATA SEGMENT
        A DB ?
        B DB ?
        MSG DB 'ENTER CHARACTER: $'
        DMSG DB ' CHARACTER IS: $'
        NXTLINE DB 10,13,'$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        LEA DX, MSG
        MOV AH, 09H ;INPUT WITH ECHO
        INT 21H

        MOV AH, 01H
        INT 21H
        MOV CL, AL ;SAVE A COPY OF AL

        LEA DX, DMSG
        MOV AH,09H
        INT 21H

        MOV DL, CL   ;DISPLAY  
        MOV AH, 02H
        INT 21H

        LEA DX, NXTLINE
        MOV AH,09H
        INT 21H

        LEA DX, MSG
        MOV AH, 09H ;INPUT WITHOUT ECHO
        INT 21H

        MOV AH, 08H
        INT 21H
        MOV CL, AL ;SAVE A COPY OF AL

        LEA DX, DMSG
        MOV AH,09H
        INT 21H

        MOV DL, CL   ;DISPLAY  
        MOV AH, 02H
        INT 21H


        MOV AH, 4CH
        INT 21H

        CODE ENDS
        END START

