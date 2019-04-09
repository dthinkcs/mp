DATA SEGMENT
 C1 DB  01000000B
 C2 DB  00100000B
 C3 DB  00010000B
DATA ENDS


CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX

 UP:
       MOV AH,00
       MOV AL,03
       INT 10H
  
       MOV BH,C1
       MOV AH,07
       MOV AL,0
       MOV CH,10
       MOV CL,2
       MOV DH,20
       MOV DL,40
       INT 10H

       MOV BH,C2
       MOV AH,07
       MOV AL,0
       MOV CH,12
       MOV CL,8
       MOV DH,18
       MOV DL,34
       INT 10H

       MOV BH,C3
       MOV AH,07
       MOV AL,0
       MOV CH,14
       MOV CL,14
       MOV DH,16
       MOV DL,28
       INT 10H


       MOV DH,C1
       MOV DL,C2
       MOV C1,DL
       MOV DL,C3
       MOV C2,DL
       MOV C3,DH

       CALL DELAY

       MOV DL,0FFH
       MOV AH,06H
       INT 21H
       JNZ DOWN
       JMP UP

DOWN:  MOV AH,4CH
       INT 21H

DELAY PROC
     MOV SI,050H
  UP1: MOV DI,0780H
  UP2: DEC DI
       CMP DI,00
       JNZ UP2
       DEC SI
       CMP SI,00
       JNZ UP1
       RET
DELAY ENDP

     CODE ENDS
    END START

