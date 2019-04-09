
data segment
 msg db "SUSH"
 COL DB 40
 ROW DB 12
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX

  up1: MOV AH,00
       MOV AL,03
       INT 10H

       MOV DL,00
       LEA DI,MSG
       MOV CL,COL
       MOV BL,ROW

  UP:  MOV BL,ROW
       MOV DH,[DI]
       PUSH DS
       MOV AX,0B800H
       MOV DS,AX

       
       MOV AL,160
       MUL BL
       MOV BX,AX
       mov al,2
       MUL CL
       ADD AX,BX
       MOV SI,AX
       MOV [SI],DH
       MOV BYTE PTR [SI+1],72H
       INC DI
       INC CL
       POP DS
       INC DL
       CMP DL,04
       JNZ UP

       
       mov ah,08
       int 21h

       MOV DL,13
       CMP DL,AL
       JZ LAST
	   

       MOV DL,48H
       CMP DL,AL
       JNZ DO1
       DEC ROW
	   DEC ROW
	   DEC ROW
	   DEC ROW
       JMP UP1

  DO1: MOV DL,50H
       CMP DL,AL
       JNZ DO2
       INC ROW
       INC ROW
       INC ROW
       INC ROW
       JMP UP1

  DO2:MOV DL,4BH
       CMP DL,AL
       JNZ DO3
       DEC COL
       DEC COL
       DEC COL
       DEC COL
       JMP UP1

  DO3:MOV DL,4DH
       CMP DL,AL
       JNZ DO4
       INC COL
       INC COL
       INC COL
       INC COL
  DO4: JMP UP1

  
  

LAST:  MOV AH,4CH
       INT 21H
     CODE ENDS
    END START

