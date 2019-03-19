data segment
	a db 'Enter password - $'
	b db 8 dup('$')
	c db '*$'
	d db '7654321'
	va db 10,'Congratulations!$'
	inv db 10,'Password Invalid$'
data ends
code segment
assume cs:code, ds:data
start:  mov ax,data ; ds <- data
        mov ds,ax
        lea dx,a ; dx <- &a
        lea si,b ; si <- &b
        mov ah,09 ; output *dx
        int 21h
        mov cx,07 ; run the loop 7 times
        back: 
			mov ah,08 ; take one char input without echo
			int 21h
			mov [si],al ; input stored at al is now stored at *si
			inc si 
			mov dx,offset c ; output a string "*\0"
			mov ah,09 ; display output
			int 21h
        loop back  
		; compare both
        mov cx,07
        lea si,b
        lea di,d
        back2: 
			mov ax,[si]
			mov bx,[di]
			inc si
			inc di
			cmp al,bl
			jne nequal
        loop back2
        lea dx,va
        mov ah,09
        int 21h
        jmp exit1
        nequal: 
		lea dx,inv
        mov ah,09
        int 21h
        exit1:
		mov ah,4ch
        int 21h

code ends
end start


