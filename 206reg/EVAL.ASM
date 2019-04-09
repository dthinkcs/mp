code segment
Assume CS:Code
Start: 
	  MOV AH, 0
	  MOV AL, 03
	  INT 10H
	  
chk:          MOV AH, 06
	  MOV AL, 0
	  MOV BH, 01110000B
          MOV CH, 8
          MOV CL, 25
	  MOV DH, 15
          MOV DL,50
	  INT 10H
          MOV dl,0ffh
          mov ah,06
          INT 21H
          CMP AL,'r'
          JZ INY
          CMP AL,'l'
          JZ DEY
          CMP AL,'u'
          JZ INX
          CMP AL,'d'
          JZ DEX
          cmp al,'t'
          jnz chk
        MOV AH, 4CH
	  INT 21H
INY: 
INC Dx
jmp chk
DEY:
DEC Dx
jmp chk


INX: INC Cx
jmp chk
DEX: DEC Cx
jmp chk
CODE ENDS
END START





