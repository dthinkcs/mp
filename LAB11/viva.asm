data segment
 msg db "This$"
 COL DB 0
 ROW DB 24
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX

  up1: MOV AH,00; clear everything remember to loop
       MOV AL,03
       INT 10H
	   
       MOV DL,00
       LEA DI,MSG
       MOV CL,COL

  UP2:  MOV BL,ROW
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
       JNZ UP2
       

       MOV DL,13
       CMP DL,AL
       JZ LAST

	   Call Delay
	   
	   CMP row, 0
	   JE downcall
	   
	   CMP col, 0
	   JE upcall
	   
	   upcall: DEC row
				INC col
				JMP ext
		downcall:
				INC row
				DEC col
				JMP ext
		ext:
       JMP UP1

  
  

LAST:  MOV AH,4CH
       INT 21H
	   
delay proc
     mov si,050h
  up: mov di,0780h
  down: dec di
       cmp di,00
       jnz down
       dec si
       cmp si,00
       jnz up
       ret
delay endp
     CODE ENDS
    END START

