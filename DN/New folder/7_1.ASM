DATA SEGMENT
A DB 32H,49H,0A4H,5CH,92H
COUNT DB 05H
B DB 32H
C DB 'NUMBER FOUND'
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV CL, COUNT
        MOV CH,0
        MOV SI, OFFSET A
        MOV BL,B
        MOV BH,0
      BACK:  CMP BL,[SI]
        JZ EXIT
        INC SI
        LOOP BACK
         EXIT:LEA DX,C
              MOV AH,09H
              INT 21H
              MOV AH,4CH
              INT 21H
              CODE ENDS
              END START
