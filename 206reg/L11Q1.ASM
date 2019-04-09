Code Segment
	Assume CS: Code
Start:
	MOV AH,06
	MOV AL,03
	int 10h
AGAIN:
	mov dl,0ffh
	mov ah,06h
	int 21h


	mov ah,06
	mov al,0
	mov bh,00010000b
	mov ch,00
	mov cl,00
	mov dh,25
	mov dl,80
	int 10
	
	mov ah,06
	mov al,0
	mov bh,00100000b
	mov ch,06
	mov cl,11
	mov dh,22
	mov dl,71
	int 10h
	mov ah,06
	mov al,0
	mov bh,01000000b
	mov ch,10
	mov cl,20
	mov dh,15
	mov dl,60
	int 10h
	call delay


	mov ah,06
	mov al,0
	mov bh,00100000b
	mov ch,00
	mov cl,00
	mov dh,25
	mov dl,80
	int 10h
	mov ah,06
	mov al,0
	mov bh,00010000b
	mov ch,05
	mov cl,10
	mov dh,20
	mov dl,70
	int 10h
	mov ah,06
	mov al,0
	mov bh,01000000b
	mov ch,10
	mov cl,20
	mov dh,15
	mov dl,60
	int 10h
	call delay
	
	
	mov ah,06
	mov al,0
	mov bh,00010000b
	mov ch,00
	mov cl,00
	mov dh,25
	mov dl,80
	int 10h
	mov ah,06
	mov al,0
	mov bh,01000000b
	mov ch,05
	mov cl,10
	mov dh,20
	mov dl,70
	int 10h
	mov ah,06
	mov al,0
	mov bh,00100000b
	mov ch,10
	mov cl,20
	mov dh,15
	mov dl,60
	int 10h
	call delay
	MOV DL, 0FFH
	MOV AH, 06H
	INT 21H
	jnz exit
	jmp again

	delay proc
	mov si,0fa0h
	down1:mov di,00e0h
	down2:dec di
	jnz down2
	dec si
	jnz down1
	ret 
	delay endp
 exit:
	mov ah,4ch
	int	21h
code ends
end start




MOV AH,4CH
INT 21H
CODE ENDS
END START
        
