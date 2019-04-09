DATA SEGMENT
        A DD 20202020H
        B DW 3232H
        QUOT DW 0
        REM DW 0
      
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,OFFSET A
        MOV DX,WORD PTR [SI+2]
        MOV AX,WORD PTR [SI]
        MOV BX,B
        DIV BX

        MOV REM,DX
        MOV QUOT,AX

        MOV AH,4CH
        INT 21H
      
        CODE ENDS
END START
