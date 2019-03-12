Data Segment
A DB ?
MSG1 DB 'enter VALUE'
line DB 10,13,'$'
Data Ends

PRINT MACRO M
     LEA DX,M
     MOV AH,09
     INT 21H

ENDM


Code Segment
    ASSUME CS:Code,DS:Data
 START:
       MOV AX,Data
       MOV DS,AX



       PRINT MSG1
       PRINT line
       MOV AH,08
       INT 21H
       PRINT line
       MOV DL,AL
       MOV AH,02
       INT 21H
       MOV AH,4CH
       INT 21H

  Code Ends
  END START



