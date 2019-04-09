data segment
 c1 db  01000000b
 iCOL DB 20
 fCOL DB 60
 iROW DB 10
 fROW DB 20
data ends


code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax

	up:
		Call DispRect
		Call delay
		mov dl,0ffh
		
		mov ah,08
		int 21h
		
		MOV DL,48H
		CMP DL,AL
		JNZ DO1
		DEC iROW
		DEC fROW
		DEC iROW
		DEC fROW
		JMP UP
		
	DO1:MOV DL,50H
		CMP DL,AL
		JNZ DO2
		INC iROW
		INC fROW
		INC iROW
		INC fROW
		JMP UP

	DO2:MOV DL,4BH
		CMP DL,AL
		JNZ DO3
		DEC iCOL
		DEC fCOL
		DEC iCOL
		DEC fCOL
		JMP UP

	DO3:MOV DL,4DH
		CMP DL,AL
		JNZ DO4
		INC iCOL
		INC fCOL
		INC iCOL
		INC fCOL
		
	DO4:JMP UP
		
		mov ah,06h
		int 21h
		jnz down
		jmp up

down:  mov ah,4ch
       int 21h
	   
DispRect PROC
	   mov ah,00
       mov al,03
       int 10h
  
       mov bh,c1
       mov ah,07
       mov al,0
       mov ch,iRow
       mov cl,iCol
       mov dh,fRow
       mov dl,fCol
       int 10h
DispRect ENDP
delay proc
     mov si,050h
  up1: mov di,0100h
  up2: dec di
       cmp di,00
       jnz up2
       dec si
       cmp si,00
       jnz up1
       ret
delay endp

code ends
end start