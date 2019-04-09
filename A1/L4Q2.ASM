DATA SEGMENT
        A DB -23H
        B DB 32H
        PROD DW 0
        
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        LEA SI,PROD
        MOV AH,0
        MOV AL,A
        MOV BH,0
        MOV BL,B
        IMUL BL

        MOV BYTE PTR [SI],AL
        INC SI
        MOV BYTE PTR [SI],AH

        MOV AH,4CH
        INT 21H
      
        CODE ENDS
END START
