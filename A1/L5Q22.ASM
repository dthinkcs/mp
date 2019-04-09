DATA SEGMENT
        BCD DW ?
        HEX DW 0
        NUM DW 10
        TEMP DB 4 DUP(0)
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,BCD
        MOV DX,0
        MOV SI,0
        MOV BX,10H
      BK:
        DIV BX
        MOV TEMP[SI],DX
        INC SI
        MOV DX,0
        CMP AX,0
       JNZ BK:
        ADD AL,DL
        MOV HEX,AL

        MOV AH,4CH
        INT 21H

     CODE ENDS
END START
