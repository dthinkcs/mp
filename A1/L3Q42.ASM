DATA SEGMENT
        A DD 99999999H
        B DD 88888888H
        SUM DD ?
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        LEA SI,A
        LEA DI,B
        MOV AX,[SI]
        SUB AX,[DI]
        MOV CX,2[SI]
        SBB CX,2[DI]

        LEA SI,SUM
        MOV [SI],AX
        MOV 2[SI],CX
        SBB CARRY,0

        MOV AH,4CH
        INT 21H
      CODE ENDS
END START

